module CHECKDIG
  extend self

  def check_digit?(p_account, p_dig)
    i = p_account.length() + 1
    j = 0
    sum_product = 0
    # multiplicando cada elemento da conta
    # exemplo: conta 261533 --> (2 * 7) + (6 * 6) + (1 * 5) + (5 * 4) + (3 * 3) + (3 * 2) = 90
    while i > 1
      sum_product += p_account[j].to_i * i
      i -= 1
      j += 1
    end

    # a soma dos produtos calculados anteriormente são multipliados por 10
    # e o dígito verificador é obtido através de uma divisão por 11
    # o resto dessa divisão é considerado o dígito verificador da conta (9)
    sum_product = (sum_product * 10)
    digit = sum_product % 11

    return p_dig.to_s == digit.to_s
  end
end


