class ShowsController < ApplicationController

  def create
    show = Show.new(show_params)
    if show.save
      redirect_to home_path
    else
      redirect_to admin_path
    end
  end

  def edit
    @show = find_show
  end

  def update
    show = find_show
    if shoq.update(show_params)
      redirect_to home_path
    else
      redirect_to admin_path
    end
  end

  def destroy
    show = find_show
    show.destroy
    redirect_to home_path
  end

  private

  def find_show
    Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(:date, :location, :link)
  end
end