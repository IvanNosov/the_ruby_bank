class BankAccountsController < ApplicationController
  before_action :require_user_logged_in!

  def show
    @bank_account = Current.user.bank_account
  end
end
