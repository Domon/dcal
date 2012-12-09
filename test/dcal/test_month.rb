require 'test/unit'
require 'dcal'

class TestMonth < Test::Unit::TestCase
  def setup
    @month = DCal::Month.new(1, 1970)
  end

  def test_constants
    assert_nil DCal::Month::COMMON_YEAR_DAYS_IN_MONTH[0]
    assert_equal 31, DCal::Month::COMMON_YEAR_DAYS_IN_MONTH[1]
    assert_equal 13 , DCal::Month::COMMON_YEAR_DAYS_IN_MONTH.size

    assert_nil DCal::Month::MONTHNAMES[0]
    assert_equal 'January', DCal::Month::MONTHNAMES[1]
    assert_equal       13 , DCal::Month::MONTHNAMES.size
  end

  def test_name
    assert 'January', @month.name
  end

  def test_days_since_1970
    month_1_1970  = DCal::Month.new(1, 1970)
    month_12_2012 = DCal::Month.new(12, 2012)

    assert_equal     0, month_1_1970.days_since_1970
    assert_equal 15675, month_12_2012.days_since_1970
  end

  def test_days_in_month
    month_1_1970 = DCal::Month.new(1, 1970)
    month_2_2012 = DCal::Month.new(2, 2012)

    assert_equal 31, month_1_1970.days_in_month
    assert_equal 29, month_2_2012.days_in_month
  end

  def test_inspect
    assert_equal "#<DCal::Month 1970-1>", @month.inspect
  end
end
