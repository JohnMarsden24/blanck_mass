class Show < ApplicationRecord
  validates :date, :location, presence: true

  def self.get_shows
    Show.where("date >= ?", Time.now).order(:date)
  end

  def self.shows_empty?(shows)
    shows.empty? ? "justify-content-center" : "justify-content-start"
  end

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

  def border?(index, shows_length)
    unless index == (shows_length - 1)
      "bottom-bord-1"
    end
  end
end
