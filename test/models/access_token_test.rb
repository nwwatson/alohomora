require 'test_helper'

class AccessTokenTest < ActiveSupport::TestCase
  def setup
    @access_token = access_tokens(:access_token_1)
  end

  test 'valid access_token' do
    assert @access_token.valid?
  end

  test 'invalid without user' do
    @access_token.user = nil
    refute @access_token.valid?
    assert_not_nil @access_token.errors[:user]
  end

  test 'invalid without token' do
    #@access_token.token = nil
    #refute @access_token.valid?
    #assert_not_nil @access_token.errors[:token]
  end

  test 'invalid without expires_at' do
    @access_token.expires_at = nil
    refute @access_token.valid?
    assert_not_nil @access_token.errors[:expires_at]
  end

  test '#expired?' do
    refute @access_token.expired?
    @access_token.expires_at = Time.now - 30.minutes
    assert @access_token.expired?
  end

  test '#revoked' do
    refute @access_token.revoked?
    @access_token.revoked_at = Time.now - 30.minutes
    assert @access_token.revoked?
  end

  test '#revoke!' do
    refute @access_token.revoked?
    @access_token.revoke!
    assert @access_token.revoked?
  end

  test '#verified?' do
    assert @access_token.verified?
  end
end
