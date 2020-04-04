class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :link
      t.string :caption
      t.string :embed

      t.timestamps
    end
  end
end
