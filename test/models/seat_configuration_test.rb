require 'test_helper'

class SeatConfigurationTest < ActiveSupport::TestCase

  test "association" do
    assert_equal airplanes(:one), seat_configurations(:first).airplane
    assert_equal seat_categories(:one), seat_configurations(:first).seat_category
    assert_equal [seats(:first_class)], seat_configurations(:first).seat_category
  end

end
