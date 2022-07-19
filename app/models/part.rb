class Part < ApplicationRecord
  belongs_to :supplier
  validates :description, presence: true
  validates :description, length: { minimum: 3 }
end
