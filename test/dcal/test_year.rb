require 'test/unit'
require 'dcal'

class TestYear < Test::Unit::TestCase
  def setup
    @year = DCal::Year.new(2012)
  end

  def test_value
    assert_equal 2012, @year.value
  end

  def test_comparable
    assert_equal 2012, @year
  end

  def test_substraction
    assert_equal 2011, @year - 1
  end

  def test_to_i
    assert_equal 2012, @year.to_i
  end

  def test_to_s
    assert_equal "2012", @year.to_s
  end

  def test_inspect
    assert_equal "#<DCal::Year 2012>", @year.inspect
  end

  def test_leap
    y_1970 = DCal::Year.new(1970)
    y_2000 = DCal::Year.new(2000)
    y_2012 = DCal::Year.new(2012)
    y_2100 = DCal::Year.new(2100)

    assert_equal false, y_1970.leap?
    assert_equal true , y_2000.leap?
    assert_equal true , y_2012.leap?
    assert_equal false, y_2100.leap?
  end

  def test_leap_years_since_1970
    y_1970 = DCal::Year.new(1970)
    y_2012 = DCal::Year.new(2012)

    assert_equal  0, y_1970.leap_years_since_1970
    assert_equal 10, y_2012.leap_years_since_1970
  end
end
