require 'test/unit'
require 'dcal'

class TestCal < Test::Unit::TestCase
  def test_constants
    assert_equal 'Su', DCal::Cal::ABBR_DAYNAMES[0]
    assert_equal   7 , DCal::Cal::ABBR_DAYNAMES.size
  end
end
