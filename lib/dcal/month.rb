require 'dcal/year'

module DCal
  class Month
    attr_reader :month, :year

    MONTHNAMES = [
      nil,
      "January", "February", "March",
      "April", "May", "June",
      "July", "August", "September",
      "October", "November", "December"
    ]

    COMMON_YEAR_DAYS_IN_MONTH = [
      nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
    ]

    def initialize(month, year)
      @month = month.to_i
      @year  = DCal::Year.new(year.to_i)

      unless (1..12).cover? @month
        raise RangeError, "#{@month} is not a month number (1..12)"
      end
    end

    def name
      MONTHNAMES[@month]
    end

    def days_since_1970
      (@year - 1970) * 365 + @year.leap_years_since_1970 + passed_days_this_year
    end

    def days_in_month
      return 29 if @month == 2 && @year.leap?
      COMMON_YEAR_DAYS_IN_MONTH[@month]
    end

    def wday_of_first_day
      # 1970-01-01 is Thursday (4).
      (days_since_1970 + 4) % 7
    end

    # For inspect
    def to_s
      "#{@year}-#{@month}"
    end

    # For better output in console
    def inspect
      "#<#{self.class.name} #{to_s}>"
    end

    private

    def passed_days_this_year
      return 0 if @month == 1
      (1...@month).reduce(0) { |sum, m| sum + DCal::Month.new(m, @year).days_in_month }
    end

  end
end

