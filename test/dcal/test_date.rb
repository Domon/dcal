require 'test/unit'
require 'dcal'

class TestDate < Test::Unit::TestCase
  def test_constants
    assert_equal 'Su', DCal::Date::DAYNAMES[0]
    assert_equal   7 , DCal::Date::DAYNAMES.size
  end
end
