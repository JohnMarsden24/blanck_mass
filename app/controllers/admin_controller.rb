class AdminController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :admin, only: [:home, :create, :update, :destroy]
  before_action :get_class_name, only: [:index, :create, :update, :destroy]

  def index
    @objects = @class_name.all.order(created_at: :desc)
  end

  def error
    @object = @class_name.new
  end

  def home
    @post = Post.new
    @show = Show.new
    @video = Video.new
    @audio = Audio.new
    @contact = Contact.new
  end

  def create
    @object = @class_name.new(strong_params)
    if @object.save
      embedded(object)
      redirect
    else
      # flash[:notice] = error_message(object)
      render "shared/error"
    end
  end

  def update
    object = find_object
    if object.update(strong_params)
      embedded(object)
      object.save
      redirect
    else
      error_message(object)
      raise
      render :home
    end
  end

  def destroy
    object = find_object
    object.destroy
    redirect
  end

  private

  def error_message(object)
    "#{object.errors.messages.keys.first.to_s} #{object.errors.messages.values.first.join}"
  end

  def admin
    unless current_user.admin
      redirect_to home_path
    end
  end

  def embedded(object)
    if @class_name.method_defined? :embed_link
      object.embed = object.embed_link
      object.save
    end
  end

  def find_object
    @class_name.find(params[:id])
  end

  def get_class_name
    @class_name = controller_name.classify.underscore.capitalize.constantize
  end

end

