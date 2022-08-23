class Account < ApplicationRecord
  belongs_to :supplier
  validates :account_number, presence: true
  validates :account_number, uniqueness: true
  validate :digit_is_valid?
end

def digit_is_valid?
  # utilizada a gem 'isbn' para validação [https://github.com/tkersey/isbn  ]
  errors.add(:digit, "Dígito verificador inválido! Por favor, verifique os dados.") unless check_digit(:account_number, :digit)
end

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
