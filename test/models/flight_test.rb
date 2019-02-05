require 'test_helper'

class FlightTest < ActiveSupport::TestCase

  test "seat configuration association" do
    assert_equal [
                  seat_configurations(:first),
                  seat_configurations(:business),
                  seat_configurations(:economy)
                ].sort,
                flights(:one).seat_configurations
  end

  test "airplane association" do
    assert_equal airplanes(:one), flights(:one).airplane
  end

  test "source and origin and destination association" do
    assert_equal airports(:one), flights(:one).origin
    assert_equal airports(:two), flights(:two).origin
  end

  test "flight number validation" do
    flight = flights(:one)
    flight.flight_number = nil
    assert_not_nil flight.valid?, flight.errors.full_messages.inspect
  end

end
