module Transactions
  class TransferMoney
    def self.call(sender:, recipient:, amount:)
      ActiveRecord::Base.transaction do
        sender.bank_account.update!(balance: sender.bank_account.balance - amount)
        recipient.bank_account.update!(balance: recipient.bank_account.balance + amount)
      end
    end
  end
end