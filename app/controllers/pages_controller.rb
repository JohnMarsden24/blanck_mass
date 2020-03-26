class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home ]

  def landing
  end

  def home
    @post = Post.new
    @posts = Post.all
  end
end
