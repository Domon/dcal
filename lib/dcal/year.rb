module DCal
  class Year
    def initialize(value)
      @value = value
    end

    def leap?
      # ref: http://en.wikipedia.org/wiki/Leap_year#Algorithm
      @value % 400 == 0 || (@value % 100 != 0 && @value % 4 == 0)
    end
  end
end
