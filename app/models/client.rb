class Client < ApplicationRecord
  #relaciones
  has_many :invoices, dependent: :restrict_with_error

  #validaciones
  validates :name, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end