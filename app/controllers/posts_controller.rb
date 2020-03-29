class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to home_path
    else
      render :new
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
      render :edit
    end
  end

  def destroy
    dose = find_post
    dose.destroy
    redirect_to home_path
  end

  private

  def admin
    if current_user.admin?
      return
    else
      redirect_to home_path
    end
  end

  def find_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
