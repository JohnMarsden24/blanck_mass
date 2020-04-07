class Post < ApplicationRecord
  validates :title, :content, presence: true

  after_save :ensure_only_one_pinned_post

  # formats time into D/M/YYY format

  def time
    self.created_at.strftime("%-d/%-m/%Y")
  end

  private

  # if a new pinned post is made or updated it will go through all records that do not match the current ID and set pinned to false

  def ensure_only_one_pinned_post
    Post.where("id != ?", id).update_all(pinned: false)
  end

end
