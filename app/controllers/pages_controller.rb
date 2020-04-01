class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home, :shows, :videos, :music ]

  def landing
  end

  def home
    @posts = Post.all.sort
    @shows = get_shows
    @layout = shows_empty(@shows)
  end

  def music
    @audio = Audio.all
  end

  def shows
    @shows = get_shows
  end

  def videos
    @videos = Video.all.sort
  end

  private

  def shows_empty(shows)
    shows.empty? ? "justify-content-center" : "justify-content-start"
  end

  def get_shows
    Show.where("date >= ?", Time.now).order(:date)
  end
end
