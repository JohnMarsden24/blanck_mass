class Post < ApplicationRecord
  validates :title, :content, presence: true

  def time
    self.created_at.strftime("%-d/%-m/%Y")
  end
end
