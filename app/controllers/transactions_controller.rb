class TransactionsController < ApplicationController
  before_action :require_user_logged_in!, only: %i[new create]

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = PerformTransactionService.new(params.merge(sender_id: Current.user.id)).call

    if @transaction.persisted? && @transaction.success
      redirect_to bank_accounts_show_path, notice: 'Success!'
    else
      redirect_to transactions_new_path, notice: 'Not enough balance. Please try again.'
    end
  end
end
