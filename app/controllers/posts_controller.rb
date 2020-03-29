class PostsController < ApplicationController

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to home_path
    else
      redirect_to admin_path
    end
  end

  def edit
    @post = find_post
  end

  def update
    post = find_post
    if post.update(post_params)
      redirect_to home_path
    else
      redirect_to admin_path
    end
  end

  def destroy
    post = find_post
    post.destroy
    redirect_to home_path
  end

  private

  def find_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
