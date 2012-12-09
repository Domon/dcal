module DCal
  class Cal
    attr_reader :month, :year

    MONTHNAMES = [
      nil,
      "January", "February", "March",
      "April", "May", "June",
      "July", "August", "September",
      "October", "November", "December"
    ]

    ABBR_DAYNAMES = %w(Su Mo Tu We Th Fr Sa)

    COMMON_YEAR_DAYS_IN_MONTH = [
      nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
    ]

    def initialize(month, year)
      @month = month.to_i
      @year  = year.to_i
    end

    def output
      title    + "\n" +
        header + "\n" +
        weeks  + "\n"
    end

    private

    def title
      "#{MONTHNAMES[month]} #{year}".center(20)
    end

    def header
      ABBR_DAYNAMES.join(" ")
    end

    def weeks
      weeks = days.each_slice(7).to_a
      weeks.map { |w| w.join(" ") }.join("\n")
    end

    def days
      days = Array.new(42, "  ")
      (1..days_in_month(month)).each do |day|
        days[weekday_of_first_day + day - 1] = day.to_s.rjust(2)
      end
      days
    end

    def weekday_of_first_day
      # 1970-01-01 is Thursday (4).
      (days_since_1970 + 4) % 7
    end

    def days_since_1970
      (year - 1970) * 365 + leap_years_since_1970 + passed_days_in_year
    end

    def leap_years_since_1970
      return 0 if year == 1970
      (1970...year).select { |y| in_leap_year?(y) }.size
    end

    def passed_days_in_year
      return 0 if month == 1
      (1...month).reduce(0) { |sum, m| sum + days_in_month(m) }
    end

    def days_in_month(month)
      return 29 if month == 2 && in_leap_year?(year)
      COMMON_YEAR_DAYS_IN_MONTH[month]
    end

    def in_leap_year?(year)
      # ref: http://en.wikipedia.org/wiki/Leap_year#Algorithm
      year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)
    end
  end
end
