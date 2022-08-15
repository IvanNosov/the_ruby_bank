class PerformTransactionService
  attr_reader :sender, :recipient, :amount

  def self.call(params)
    new(params).perform_transaction
  end

  def initialize(params)
    @sender = params[:sender]
    @recipient = User.find_by(id: params[:recipient_id])
    @amount = params[:amount].to_i
  end

  def perform_transaction
    transaction = Transactions::Setup.call(sender:, recipient:, amount:)
    Transactions::TransferMoney.call(sender:, recipient:, amount:) if transaction.persisted? && transaction.success 

    transaction
  end
end

