class AddEmbedtoAudioAndVideo < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :embed, :string
    add_column :audios, :embed, :string
  end
end
