class Account < ApplicationRecord
  belongs_to :supplier
  validates :account_number, presence: true
  validates :account_number, uniqueness: true
  validate :account_digit_is_valid?

  private

  def account_digit_is_valid?
    d = CheckAccountDigit.new(account_number, digit)
    errors.add(:digit, "Dígito verificador inválido! Por favor, verifique os dados.") unless d.check_digit?
  end
end
