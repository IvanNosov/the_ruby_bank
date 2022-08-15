class TransactionPolicy
  def self.allowed?(sender:, recipient:, amount:)
    sender.bank_account.balance - amount >= 0 &&
      sender != recipient &&
      amount.positive?
  end
end
