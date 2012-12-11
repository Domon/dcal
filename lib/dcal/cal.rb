require 'dcal/month'

module DCal
  class Cal
    ABBR_DAYNAMES = %w(Su Mo Tu We Th Fr Sa)

    def initialize(month, year)
      @month = DCal::Month.new(month, year)
      @year  = DCal::Year.new(year)
    end

    def output
      title    + "\n" +
        header + "\n" +
        weeks  + "\n"
    end
    
    def month
      @month.month
    end

    def year
      @year
    end

    private

    def title
      "#{@month.name} #{@year}".center(20)
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
      (1..@month.days_in_month).each do |day|
        days[@month.wday_of_first_day + day - 1] = day.to_s.rjust(2)
      end
      days
    end
  end
end
