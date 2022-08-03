class Transaction < ApplicationRecord
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  def sender
    User.find_by(id: sender_id)
  end

  def recipient
    User.find_by(id: recipient_id)
  end
end
