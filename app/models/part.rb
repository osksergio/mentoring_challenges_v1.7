class Part < ApplicationRecord
  belongs_to :supplier
  has_and_belongs_to_many :assemblies
  validates :description, presence: true
  validates :description, length: { minimum: 3 }
end
