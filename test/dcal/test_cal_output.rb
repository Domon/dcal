require 'test/unit'
require 'dcal'

class TestCalOutput < Test::Unit::TestCase
  def test_output
    output_1_1970 = <<-OUTPUT
    January 1970    
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31
                    
OUTPUT

    output_8_1998 = <<-OUTPUT
    August 1998     
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31               
OUTPUT

    output_12_2012 = <<-OUTPUT
   December 2012    
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31               
OUTPUT

    cal_1_1970  = DCal::Cal.new( 1, 1970)
    cal_8_1998  = DCal::Cal.new( 8, 1998)
    cal_12_2012 = DCal::Cal.new(12, 2012)

    assert_equal output_1_1970,  cal_1_1970.output
    assert_equal output_8_1998,  cal_8_1998.output
    assert_equal output_12_2012, cal_12_2012.output
  end
end
