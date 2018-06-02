require 'test_helper'

class AccountUserTest < ActiveSupport::TestCase

  def setup
    @account_user = account_users(:account_user_1_1)
  end

  test 'valid account_user' do
    assert @account_user.valid?
  end

  test 'invalid without user' do
    @account_user.user = nil
    refute @account_user.valid?
    assert_not_nil @account_user.errors[:user]
  end

  test 'invalid without account' do
    @account_user.account = nil
    refute @account_user.valid?
    assert_not_nil @account_user.errors[:account]
  end

  test '#account' do
    test_account = accounts(:account_1)
    assert_equal test_account, @account_user.account
  end

  test '#user' do
    test_user = users(:user_1)
    assert_equal test_user, @account_user.user
  end
end
