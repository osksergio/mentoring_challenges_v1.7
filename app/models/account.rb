class Account < ApplicationRecord
  belongs_to :supplier
  validates :account_number, presence: true
  validates :account_number, uniqueness: true
  validate :account_digit_is_valid?
end

def account_digit_is_valid?
  is_valid = CHECKDIG::CheckAccountDigit.new
  result = is_valid.check_digit(:account_number, :digit)
  errors.add(:digit, "Dígito verificador inválido! Por favor, verifique os dados.") unless result
  #errors.add(:digit, "Dígito verificador inválido! Por favor, verifique os dados.") unless CHECKDIG.check_digit(:account_number, :digit)
end

=begin
def check_digit(p_account, p_dig)
  range = 0..( p_account.length() - 1 )
  p_account = p_account.reverse
  sum_product = 0

  for i in range
    sum_product += p_account[i].to_i * (i + 2)
  end

  sum_product = (sum_product * 10)
  digit = sum_product % 11

  if p_dig.to_i == digit
    return  true
  else
    return false
  end
end
=end
