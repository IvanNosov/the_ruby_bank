module Transactions
  class Setup
    def self.call(sender:, recipient:, amount:)
      success = TransactionPolicy.allowed?(sender:, recipient:, amount:)
      Transaction.create(sender:, recipient:, amount:, success:)
    end
  end
end