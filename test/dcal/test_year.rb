require 'test/unit'
require 'dcal'

class TestYear < Test::Unit::TestCase
  def test_year_leap
    y_1970 = DCal::Year.new(1970)
    y_2000 = DCal::Year.new(2000)
    y_2012 = DCal::Year.new(2012)
    y_2100 = DCal::Year.new(2100)

    assert_equal false, y_1970.leap?
    assert_equal true , y_2000.leap?
    assert_equal true , y_2012.leap?
    assert_equal false, y_2100.leap?
  end
end
