class TransactionsController < ApplicationController
  before_action :require_user_logged_in!, only: %i[new create]

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = PerformTransactionService.call(params.merge(sender: Current.user))

    if @transaction.persisted? && @transaction.success
      redirect_to bank_accounts_show_path, notice: 'Success!'
    elsif @transaction.persisted? && !@transaction.success 
      redirect_to transactions_new_path, notice: "Not enough money"
    else
      redirect_to transactions_new_path, notice: "Error happened: #{@transaction.errors.full_messages.join(", ")}"
    end
  end
end
