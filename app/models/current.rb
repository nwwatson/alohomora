class Current < ActiveSupport::CurrentAttributes
  attribute :account, :user, :locale
  attribute :request_id, :user_agent, :ip_address

  resets { Time.zone = nil }

  def user=(user)
    super
    self.account = user.default_account
    self.locale = user.locale
    Time.zone    = user.time_zone
  end
end
