class VideosController < ApplicationController

  def create
    video = Video.new(video_params)
    video.link = video.embed
    if video.save
      redirect_to videos_path
    else
      redirect_to admin_path
    end
  end

  def update
    video = find_video
    if video.update(video_params)
      video.link = video.embed
      video.save
      redirect_to videos_path
    else
      redirect_to admin_path
    end
  end

  def destroy
    video = find_video
    video.destroy
    redirect_to videos_path
  end

  private

  def find_video
    Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:link, :caption)
  end
end
