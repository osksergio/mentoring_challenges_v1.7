module CHECKDIG
  def check_digit(p_account, p_dig)
    range = 0..( p_account.length() - 1 )
    p_account = p_account.reverse
    sum_product = 0

    for i in range
      sum_product += p_account[i].to_i * (i + 2)
    end

    sum_product = (sum_product * 10)
    digit = sum_product % 11

    #return digit

    if p_dig.to_i == digit
      return  true
    else
      return false
    end
  end
end

=begin
testando1 = check_digit('261533', '8')
puts testando1

testando2 = check_digit('261533', '9')
puts testando2
=end