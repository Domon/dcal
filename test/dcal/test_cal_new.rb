require 'test/unit'
require 'dcal'

class TestCalNew < Test::Unit::TestCase
  def setup
    @cal = DCal::Cal.new 12, 2012
  end

  def test_new
    assert_instance_of DCal::Cal, @cal
  end

  def test_month
    assert_equal 12, @cal.month
  end

  def test_year
    assert_equal 2012, @cal.year
  end
end
