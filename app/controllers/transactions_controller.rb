class TransactionsController < ApplicationController
  before_action :require_user_logged_in!, only: %i[new create]

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = PerformTransactionService.call(params.merge(sender_id: Current.user.id))

    if @transaction.persisted? && @transaction.success
      redirect_to bank_accounts_show_path, notice: 'Success!'
    else
      redirect_to transactions_new_path, notice: 'Not enough balance. Please try again.'
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to transactions_new_path, notice: 'User not found'
  end
end
