class PostsController < ApplicationController
  def new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to home_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
