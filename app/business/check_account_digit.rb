class CheckAccountDigit
  def initialize(account, digit)
    @account = account
    @digit = digit
  end

  def check_digit?
    i = @account.length() + 1
    j = 0
    sum_product = 0
    while i > 1
      sum_product += @account[j].to_i * i
      i -= 1
      j += 1
    end

    sum_product = (sum_product * 10)
    digit = sum_product % 11
    @digit.to_s == digit.to_s
  end
end
