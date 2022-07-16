class Assembly < ApplicationRecord
  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 100 }
end
