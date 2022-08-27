require 'rails_helper'

RSpec.describe "Validando o dígito verificador da conta" do

  it 'Teste 1: Dígito inválido' do
    account_1 = '261533'
    digit_1 = '8'
    result = CHECKDIG.check_digit?(account_1, digit_1)
    expect(result).to be_falsey
  end

  it 'Teste 2: Dígito válido' do
    account_2 = '261533'
    digit_2 = '9'
    result = CHECKDIG.check_digit?(account_2, digit_2)
    expect(result).to be_truthy
  end

  it 'Teste 3: Dígito inválido' do
    account_3 = '261533'
    digit_3 = '5'
    result = CHECKDIG.check_digit?(account_3, digit_3)
    expect(result).to be_falsey
  end

end
