class User < ApplicationRecord
  has_secure_password
  after_create :setup_bank_account
  has_one :bank_account
  validates :email, uniqueness: true

  private

  def setup_bank_account
    bank_account = BankAccount.create(user_id: id)
  end
end
