class Supplier < ApplicationRecord
  has_one :account
  has_many :parts
  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 60 }
  validate :cnpj_is_valid?

  scope :by_supplier_name, ->(query) { where("LOWER(description) LIKE ?", "%#{query}%") }
  scope :by_account_number, ->(query) { joins(:account).where("LOWER(accounts.account_number) LIKE ?", "%#{query}%") }
end

private

def cnpj_is_valid?
  errors.add(:cnpj, "CNPJ inválido! Por favor, verifique os dados." ) unless CNPJ.valid?(cnpj)
end
