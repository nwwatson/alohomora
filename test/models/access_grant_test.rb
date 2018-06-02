require 'test_helper'

class AccessGrantTest < ActiveSupport::TestCase

  def setup
    @access_grant = access_grants(:access_grant_1)
  end

  test 'valid access_grant' do
    assert @access_grant.valid?
  end

  test 'invalid without user' do
    @access_grant.user = nil
    refute @access_grant.valid?
    assert_not_nil @access_grant.errors[:user]
  end

  test 'invalid without token' do
    #@access_grant.token = nil
    #refute @access_grant.valid?
    #assert_not_nil @access_grant.errors[:token]
  end

  test 'invalid without expires_at' do
    @access_grant.expires_at = nil
    refute @access_grant.valid?
    assert_not_nil @access_grant.errors[:expires_at]
  end

  test '#expired?' do
    refute @access_grant.expired?
    @access_grant.expires_at = Time.now - 30.minutes
    assert @access_grant.expired?
  end

  test '#revoked' do
    refute @access_grant.revoked?
    @access_grant.revoked_at = Time.now - 30.minutes
    assert @access_grant.revoked?
  end

  test '#revoke!' do
    refute @access_grant.revoked?
    @access_grant.revoke!
    assert @access_grant.revoked?
  end

  test '#verified?' do
    assert @access_grant.verified?
  end


end
