class Supplier < ApplicationRecord
  has_one :account
  has_many :parts
  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 60 }
end
