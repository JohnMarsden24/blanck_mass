class AudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @audio = Audio.all.order(created_at: :desc)
  end

  def create
    audio = Audio.new(audio_params)
    audio.link = audio.embed
    if audio.save
      redirect_to music_path
    else
      redirect_to admin_path
    end
  end

  def update
    audio = find_audio
    if audio.update(audio_params)
      audio.link = audio.embed
      audio.save
      redirect_to music_path
    else
      redirect_to admin_path
    end
  end

  def destroy
    audio = find_audio
    audio.destroy
    redirect_to music_path
  end

  private

  def find_audio
    Audio.find(params[:id])
  end

  def audio_params
    params.require(:audio).permit(:link)
  end
end
