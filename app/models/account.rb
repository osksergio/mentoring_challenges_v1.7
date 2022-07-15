class Account < ApplicationRecord
  belongs_to :supplier
  validates :account_number, presence: true
  validates :account_number, uniqueness: true
end
