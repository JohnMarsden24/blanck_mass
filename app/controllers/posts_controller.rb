class PostsController < ObjectsController

  def index
    super
    @shows = Show.get_shows
    @layout = Show.shows_empty?(@shows)
  end

  private

  def redirect
    redirect_to home_path
  end

  def strong_params
    params.require(:post).permit(:title, :content)
  end
end
