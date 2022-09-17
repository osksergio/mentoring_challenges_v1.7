class Author < ApplicationRecord
  has_many :books
  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 60 }
  validate :cpf_is_valid?

  private

  def cpf_is_valid?
    errors.add(:cpf, "CPF inválido! Por favor, verificar os dados.") unless CPF.valid?(cpf)
  end
end





