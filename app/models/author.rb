class Author < ApplicationRecord
  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 60 }
end
