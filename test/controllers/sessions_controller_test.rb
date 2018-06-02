require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get session_url
    assert_response 302
  end

  test "should get destroy" do
    delete session_url
    assert_response 302
  end

end
