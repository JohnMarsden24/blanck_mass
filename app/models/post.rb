class Post < ApplicationRecord

  def time
    self.created_at.strftime("%-d/%-m/%Y")
  end
end
