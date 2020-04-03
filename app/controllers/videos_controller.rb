class VideosController < AdminController

  private

  def redirect
    redirect_to videos_path
  end

  def strong_params
    params.require(:video).permit(:link, :caption)
  end
end
