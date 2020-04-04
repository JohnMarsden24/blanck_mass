class CreateAudios < ActiveRecord::Migration[6.0]
  def change
    create_table :audios do |t|
      t.string :link
      t.string :embed

      t.timestamps
    end
  end
end
