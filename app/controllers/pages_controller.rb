class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home, :shows ]

  def landing
  end

  def home
    @posts = Post.all.sort
    get_shows
  end

  def shows
    get_shows
  end

  private

  def get_shows
    @shows = Show.where("date >= ?", Time.now).order(:date)
  end


end
