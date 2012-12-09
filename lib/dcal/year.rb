module DCal
  class Year
    include Comparable

    attr_reader :value

    def initialize(value)
      @value = value.to_i
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
        value <=> other
      else
        value <=> other.value
      end
    end

    def -(integer)
      value - integer
    end

    def to_i
      @value
    end

    def to_s
      @value.to_s
    end

    def inspect
      "#<#{self.class.name} #{to_s}>"
    end
  end
end
