require 'test_helper'

class AccessGrantMailerTest < ActionMailer::TestCase
  test "notify" do
    user = users(:user_1)
    access_grant = access_grants(:access_grant_1)
    mail = NewAccountMailer.notify(user, access_grant)
    assert_equal "Your new Requollect account", mail.subject
    assert_equal [user.email], mail.to
  end
end
