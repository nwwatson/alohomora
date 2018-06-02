require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  def setup
    @account = accounts(:account_1)
  end

  test 'valid account' do
    assert @account.valid?
  end

  test 'invalid without name' do
    @account.name = nil
    refute @account.valid?
    assert_not_nil @account.errors[:name]
  end

  test '#account_users' do
    test_user = account_users(:account_user_1_1)
    assert_includes @account.account_users, test_user
  end

  test '#users' do
    test_user = users(:user_1)
    assert_includes @account.users, test_user
  end

end
