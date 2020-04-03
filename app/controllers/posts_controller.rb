class PostsController < AdminController

  private

  def redirect
    redirect_to home_path
  end

  def strong_params
    params.require(:post).permit(:title, :content)
  end
end
