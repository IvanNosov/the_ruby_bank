class Transaction < ApplicationRecord
  belongs_to :sender,   class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
