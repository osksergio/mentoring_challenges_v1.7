class Book < ApplicationRecord
  belongs_to :author
  validates :title, presence: true
  validates :title, length: { minimum: 3, maximum: 100 }
end
