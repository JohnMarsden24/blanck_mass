class ShowsController < ApplicationController


  def create
    show = Show.new(show_params)
    if show.save
      redirect_to home_path
    else
      redirect_to admin_page_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def show_params
    params.require(:show).permit(:date, :location, :link)
  end
end
