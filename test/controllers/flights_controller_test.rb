require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post sessions_url, params: { email: "admin@gamil.com", password: 'password'}
  end

  test "should get success" do
    get flights_url
    assert_response :success
  end

  test "should allow to initialize new flight" do
    get new_flight_url
    assert_response :success
  end

  test "should create flight" do
    assert_difference("Flight.count", 1,
      'Should create 1 flight') do
      post flights_url, params: { flight: { :airplane_id => airplanes(:one).id,
                                 :flight_number => 'f1234',
                                 :origin_id => airports(:one).id,
                                 :destination_id => airports(:two).id }}
    end

    assert_redirected_to flights_path
  end

  test "should able to edit" do
    get edit_flight_url(flights(:one))
    assert_response :success
  end

  test "show" do
    get flight_url(flights(:one))
    assert_response :success
  end

  test "destroy" do
    assert_difference("Flight.count", -1,
      "Should delete 1 flight") do
      delete flight_url(flights(:one))
    end

    assert_redirected_to flights_path
  end

end
