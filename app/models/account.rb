class Account < ApplicationRecord
  belongs_to :supplier
  validates :account_number, presence: true
  validates :account_number, uniqueness: true
  validate :account_digit_is_valid?
end

def account_digit_is_valid?
  errors.add(:digit, "Dígito verificador inválido! Por favor, verifique os dados.") unless CHECKDIG.check_digit?(account_number, digit)
end
