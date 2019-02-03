require 'test_helper'

class AirplanesControllerTest < ActionDispatch::IntegrationTest
  def setup
    post sessions_url, params: { email: "admin@gamil.com", password: 'password'}
  end

  test "should get success" do
    get airplanes_url
    assert_response :success
  end

  test "should allow to initialize new airplane" do
    get new_airplane_url
    assert_response :success
  end

  test "should create airplane" do
    assert_difference("Airplane.count", 1,
      'Should create 1 airplane') do
      post airplanes_url, params: {
                          airplane: {
                            :name => "Test",
                            :airplane_type => "APS123"
                          }
                        }
    end

    assert_redirected_to airplanes_path
  end

  test "should able to edit" do
    get edit_airplane_url(airplanes(:one))
    assert_response :success
  end

  test "show" do
    get airplane_url(airplanes(:one))
    assert_response :success
  end

  test "destroy" do
    assert_difference("Flight.count", -1,
      "Should delete 1 flight") do
      delete airplane_url(airplanes(:one))
    end

    assert_redirected_to airplanes_path
  end

end
