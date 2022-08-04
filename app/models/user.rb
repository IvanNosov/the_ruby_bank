class User < ApplicationRecord
  has_secure_password
  has_one :bank_account
  has_many :sent_transactions, foreign_key: :sender_id, class_name: 'Transaction'
  has_many :received_transactions, foreign_key: :recipient_id, class_name: 'Transaction'
  after_create :setup_bank_account
  validates :email, uniqueness: true

  def all_transactions
    (sent_transactions + received_transactions).sort_by(&:created_at)
  end

  private

  def setup_bank_account
    bank_account = BankAccount.create(user_id: id)
  end
end
