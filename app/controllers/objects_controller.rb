class ObjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :get_class_name

  def index
    @objects = @class_name.all.order(created_at: :desc)
  end

  def create
    object = @class_name.new(strong_params)
    embedded(object)
    if object.save
      redirect
    else
      redirect_to admin_path
    end
  end

  def update
    object = find_object
    if object.update(strong_params)
      embedded(object)
      object.save
      redirect
    else
      redirect_to admin_path
    end
  end

  def destroy
    object = find_object
    object.destroy
    redirect
  end

  private

  def embedded(object)
    if @class_name.method_defined? :embed_link
      object.embed = object.embed_link
    end
  end

  def find_object
    @class_name.find(params[:id])
  end

  def get_class_name
    @class_name = controller_name.classify.underscore.capitalize.constantize
  end
end
