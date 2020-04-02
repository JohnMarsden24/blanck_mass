class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home ]

  def landing
  end

  def home
    @posts = Post.all.sort
    @shows = Show.get_shows
    @layout = shows_empty(@shows)
  end

  private

  def shows_empty(shows)
    shows.empty? ? "justify-content-center" : "justify-content-start"
  end
end
