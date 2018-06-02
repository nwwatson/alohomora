require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user_1)
  end

  test "valid user" do
    assert @user.valid?
  end

  test "invalid without name" do
    @user.name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:name]
  end

  test "invalid with email" do
    @user.email = nil
    refute  @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test "invalid with invalid email" do
    @user.email = "suckerpunchtotheface"
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test '#access_grants' do
    assert_equal 1, @user.access_grants.size
  end

  test '#access_tokens' do
    assert_equal 1, @user.access_tokens.size
  end

  test '#accounts' do
    assert_includes @user.accounts, accounts(:account_1)
  end

end
