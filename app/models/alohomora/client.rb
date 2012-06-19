class Alohomora::Client < ActiveRecord::Base
  attr_accessible :blocked, :created_from, :granted_times, :info, :name, :redirect_uri, :revoked_times, :secret, :site_uri, :uri

  validates :name, presence: true
  validates :uri, presence: true, url: true
  validates :created_from, presence: true, url: true
  validates :redirect_uri, presence: true, url: true

  # Block the client
  def block!
    self.blocked = Time.now
    self.save
    Alohomora::OauthToken.block_client!(self.uri)
    Alohomora::OauthAuthorization.block_client!(self.uri)
  end

  # Unblock the client
  def unblock!
    self.blocked = nil
    self.save
  end

  # Check if the status is or is not blocked
  def blocked?
    !self.blocked.nil?
  end

  # Increase the counter of resource owners granting the access
  # to the client
  def granted!
    self.granted_times += 1
    self.save
  end

  # Increase the counter of resource owners revoking the access
  # to the client
  def revoked!
    self.revoked_times += 1
    self.save
  end

  def scope_pretty
    separator = Alohomora::Oauth.settings["scope_separator"]
    scope.join(separator)
  end

  def scope_values_pretty
    separator = Alohomora::Oauth.settings["scope_separator"]
    scope_values.join(separator)
  end

  class << self

    # Filter to the client uri (internal identifier) and the
    # redirect uri
    def where_uri(client_uri, redirect_uri)
      where(uri: client_uri, redirect_uri: redirect_uri)
    end

    # Filter to the client secret and the redirect uri
    def where_secret(secret, client_uri)
      where(secret: secret, uri: client_uri)
    end

    # Filter to the client scope
    def where_scope(scope)
      all_in(scope_values: scope)
    end

    # Sync all clients with the correct exploded scope when a
    # scope is modified (changed or removed)
    def sync_clients_with_scope(scope)
      Client.all.each do |client|
        scope_string = client.scope.join(Alohomora::Oauth.settings["scope_separator"])
        client.scope_values = Alohomora::Oauth.normalize_scope(scope_string)
        client.save
      end
    end
  end


  private

    # TODO: use atomic updates
    # https://github.com/mongoid/mongoid/commit/aa2c388c71529bf4d987b286acfd861eaac530ce
    def block_tokens!
      Alohomora::OauthToken.where(client_uri: uri).map(&:block!)
    end

    def block_authorizations!
      Alohomora::OauthAuthorization.where(client_uri: uri).map(&:block!)
    end

    def random_secret
      self.secret = ActiveSupport::SecureRandom.hex(Alohomora::Oauth.settings["random_length"])
    end

    def clean
      Alohomora::OauthToken.where(client_uri: uri).destroy_all
      Alohomora::OauthAuthorization.where(client_uri: uri).destroy_all
    end
end
