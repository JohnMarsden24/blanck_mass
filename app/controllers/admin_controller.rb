class AdminController < ApplicationController
  before_action :admin

  def home
    @post = Post.new
    @show = Show.new
  end

  private

  def admin
    unless current_user.admin
      redirect_to home_path
    end
  end

end
