class PerformTransactionService
  def initialize(params)
    @sender = User.find_by!(id: params[:sender_id])
    @recipient = User.find_by!(id: params[:recipient_id])
    @amount = params[:amount].to_i
    @transaction = nil
  end

  def call
    perform_transaction
  end

  private

  attr_reader :sender, :recipient, :amount

  def sender_has_enough_balance?
    sender.bank_account.balance - amount >= 0
  end

  def amount_positive?
    amount >= 0
  end

  def setup_transaction
    success = sender_has_enough_balance? ? true : false
    @transaction = Transaction.new(sender_id: sender.id, recipient_id: recipient.id, amount:, success:)
    @transaction.save!
  end

  def update_balances
    ActiveRecord::Base.transaction do
      sender.bank_account.update!(balance: sender.bank_account.balance - amount)
      recipient.bank_account.update!(balance: recipient.bank_account.balance + amount)
    end
  end

  def perform_transaction
    setup_transaction
    update_balances if @transaction.persisted? && @transaction.success

    @transaction
  end
end
