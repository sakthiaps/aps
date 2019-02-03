require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get signup_url
    assert_response :success
  end

  test "should create user" do
    get signup_url

    assert_difference("User.count",1,
      "Should create one user") do
      post users_url, params: { user: { name: "siva",
        email: "testtest@gmail.com",
        password: "password",
        password_confirmation: "password"
        }
      }
    end

    assert_redirected_to root_url
  end

end
