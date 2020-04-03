class Contact < ApplicationRecord
  validates :email, :name, presence: true
end
