require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post sessions_url, params: { email: "admin@gamil.com", password: 'password'}
  end

  test "index" do
    get bookings_url
    assert_response :success
  end

  test "should show available seats" do
    get bookings_url, params: { pnr_number: 'gtu128hj' }, xhr: true
    assert_response :success
  end

  test "booking confirmation" do
    get confirmation_bookings_url, params: { pnr_numbers: ["werty2sk", 'gtu128hj'] }

    assert_equal [seats(:first_class), seats(:business_class)], assigns(:selected_seats)

    assert_response :success
  end

  test "should book the selected_seats" do
    post book_bookings_url, params: { seat_ids: [seats(:first_class).id, seats(:business_class).id] }

    assert_redirected_to bookings_path
  end

end
