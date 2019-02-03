require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get success" do
    get root_url
    assert_response :success
  end

  test "should create session" do
    post sessions_url, params: { email: "admin@gamil.com", password: 'password'}
    assert_redirected_to home_path
  end

  test "should not create session" do
    post sessions_url, params: { email: "admin@gamil.com", password: 'password1'}
    assert_redirected_to root_url
  end

  test "should destroy session" do
    post sessions_url, params: { email: "admin@gamil.com", password: 'password'}

    get logout_url
    assert_redirected_to root_url
  end

end
