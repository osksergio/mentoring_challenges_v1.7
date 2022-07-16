class Part < ApplicationRecord
  validates :description, presence: true
  validates :description, length: { minimum: 3 }
end
