module BankAccountsHelper
  def all_transactions
    transactions = Transaction.where(sender_id: Current.user.id).order(:created_at) +
                   Transaction.where(recipient_id: Current.user.id).order(:created_at)
    transactions.sort_by(&:created_at)
  end
end
