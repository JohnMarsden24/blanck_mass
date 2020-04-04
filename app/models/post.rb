class Post < ApplicationRecord
  validates :title, :content, presence: true

  after_save :ensure_only_one_pinned_post

  def time
    self.created_at.strftime("%-d/%-m/%Y")
  end

  private

  def ensure_only_one_pinned_post
    Post.where("id != ?", id).update_all(pinned: false)
  end

end
