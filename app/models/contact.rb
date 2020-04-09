class Contact < ApplicationRecord
  validates :email, :name, presence: true

  # wil display a border on each item apart from the last via the class

  def border?(index, contacts_length)
    unless index == (contacts_length - 1)
      "bottom-bord-1"
    end
  end
end
