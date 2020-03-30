class Show < ApplicationRecord

  def display_date
    date = self.date.strftime("%-d#{ordinal_check} %b %y")
  end

  def ordinal_check
    case self.date.strftime("%-d")
      when "1", "21", "31"
        "st"
      when "2", "22"
        "nd"
      when "3", "23"
        "rd"
      else
        "th"
    end
  end
end
