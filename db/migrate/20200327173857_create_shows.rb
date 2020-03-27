class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.date :date
      t.string :location
      t.string :link

      t.timestamps
    end
  end
end
