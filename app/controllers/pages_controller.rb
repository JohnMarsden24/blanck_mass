class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home ]

  def landing
  end

  def home
    @posts = Post.all.sort
    @shows = Show.all.sort
  end

end
