require 'test_helper'

class AirportTest < ActiveSupport::TestCase

  test "list of airports" do
    assert_equal [
      ["Madurai, Tamilnadu", 298486374],
      ["Chennai, Tamilnadu", 980190962]
    ],
    Airport.list_airports
  end

  test "airport with name" do
    assert_equal "Chennai, Tamilnadu", airports(:one).name_with_state
  end

end
