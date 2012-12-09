require 'test/unit'
require 'dcal'

class TestCalOutput < Test::Unit::TestCase
  def setup
    @cal = DCal::Cal.new 12, 2012
  end

  def test_output
    sample_output = <<-OUTPUT
   December 2012    
Su Mo Tu We Th Fr Sa
OUTPUT
    assert_equal sample_output, @cal.output
  end
end
