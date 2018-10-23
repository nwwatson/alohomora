module CurrentConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_account
    helper_method :current_account_slug
    helper_method :current_user
  end

  def current_account
    Current.account
  end

  def current_account_slug
    current_account.slug
  end

  def current_user
    Current.user
  end

end
