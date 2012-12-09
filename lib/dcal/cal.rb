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

    def initialize(month, year)
      @month = month.to_i
      @year  = year.to_i
    end

    def output
      title.center(20) + "\n" +
        header         + "\n"
      # + weeks
    end

    private

    def title
      "#{MONTHNAMES[month]} #{year}"
    end

    def header
      ABBR_DAYNAMES.join(" ")
    end
  end
end
