class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 100 }
end
