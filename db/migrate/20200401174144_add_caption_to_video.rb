class AddCaptionToVideo < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :caption, :string, default: ""
  end
end
