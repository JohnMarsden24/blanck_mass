class Show < ApplicationRecord
  validates :date, :location, presence: true

  # Displays date as DDth/abbreivated month name/year

  def display_date
    self.date.strftime("%-d#{ordinal_check} %b %y")
  end

  # will insert correct ordinal based on date

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

  # wil display a border on each item apart from the last via the class

  def border?(index, shows_length)
    unless index == (shows_length - 1)
      "bottom-bord-1"
    end
  end

  private

  # only retrives shows which have not happened yet to prevent displaying out of date shows

  def self.get_shows
    Show.where("date >= ?", Time.now).order(:date)
  end

  # if there are no shows the layout changes to center, but if there is it is displayed on the left

  def self.shows_empty?(shows)
    shows.empty? ? "justify-content-center" : "justify-content-start"
  end

end
