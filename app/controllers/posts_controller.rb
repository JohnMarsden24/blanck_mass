class PostsController < ObjectsController

  def index
    @posts = Post.all.reorder(pinned: :desc, created_at: :desc)
    @shows = Show.get_shows
    @layout = Show.shows_empty?(@shows)
  end

  private

  def redirect
    redirect_to paths_index_path
  end

  def strong_params
    params.require(:post).permit(:title, :content, :pinned)
  end
end
