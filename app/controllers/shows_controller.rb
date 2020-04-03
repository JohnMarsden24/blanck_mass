class ShowsController < ObjectsController

  def index
    @shows = Show.get_shows
  end

  private

  def redirect
    redirect_to shows_path
  end

  def strong_params
    params.require(:show).permit(:date, :location, :link)
  end
end
