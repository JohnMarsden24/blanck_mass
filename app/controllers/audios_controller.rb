class AudiosController < ObjectsController

  private

  def redirect
    redirect_to audios_index_path
  end

  def strong_params
    params.require(:audio).permit(:link)
  end
end
