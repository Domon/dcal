module DCal
  class Year
    include Comparable

    def initialize(value)
      @value = value.to_i

      unless (1970..9999).cover? @value
        raise RangeError, "year #{@value} not in range 1970..9999"
      end
    end

    def leap?
      # ref: http://en.wikipedia.org/wiki/Leap_year#Algorithm
      @value % 400 == 0 || (@value % 100 != 0 && @value % 4 == 0)
    end

    def leap_years_since_1970
      return 0 if @value == 1970
      (1970...@value).select { |y| DCal::Year.new(y).leap? }.size
    end

    def <=>(other)
      if other.integer?
        to_i <=> other
      else
        to_i <=> other.to_i
      end
    end

    def -(integer)
      to_i - integer
    end

    # For calculations
    def to_i
      @value
    end

    # For inspect
    def to_s
      @value.to_s
    end

    # For better output in console
    def inspect
      "#<#{self.class.name} #{to_s}>"
    end
  end
end
