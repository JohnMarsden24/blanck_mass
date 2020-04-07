class ObjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :get_class_name

  def index
    @objects = @class_name.all.order(created_at: :desc)
  end

  def create
    @object = @class_name.new(strong_params)
    if @object.save
      redirect
    else
      render "shared/error"
    end
  end

  def update
    @object = find_object
    if @object.update(strong_params)
      redirect
    else
      render "shared/error"
    end
  end

  def destroy
    object = find_object
    object.destroy
    redirect
  end

  private

  def find_object
    @class_name.find(params[:id])
  end

  # Method gets the Class name of the object which is used in further methods

  def get_class_name
    @class_name = controller_name.classify.underscore.capitalize.constantize
  end
end
