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
      weeks = cells.each_slice(7).to_a
      weeks.map { |week| week.join(" ") }.join("\n")
    end

    def cells
      cells = Array.new(42, "  ")

      days  = 1..@month.days_in_month
      start = @month.wday_of_first_day

      cells.each_index do |i|
        day = i - start + 1
        cells[i] = day.to_s.rjust(2) if days.cover?(day)
      end

      cells
    end
  end
end
