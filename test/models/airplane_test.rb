require 'test_helper'

class AirplaneTest < ActiveSupport::TestCase

  test "seat configuration relationship" do
    assert_equal [
                  seat_configurations(:first),
                  seat_configurations(:business),
                  seat_configurations(:economy)
                ].sort,
                airplanes(:one).seat_configurations
  end

  test "Should not create a new user" do
    assert_equal [flights(:one)], airplanes(:one).flights
  end

  test "list of airplanes" do
    assert_equal [
      ["Boeing", 298486374],
      ["Airbus", 980190962]
    ], Airplane.list_of_airplanes
  end

end
