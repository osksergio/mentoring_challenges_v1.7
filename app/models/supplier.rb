class Supplier < ApplicationRecord
  has_one :account
  has_many :parts
  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 60 }
  validate :cnpj_is_valid?
end

private

def cnpj_is_valid?
  errors.add(:cnpj, "CNPJ inválido! Por favor, verifique os dados." ) unless CNPJ.valid?(cnpj)
end
