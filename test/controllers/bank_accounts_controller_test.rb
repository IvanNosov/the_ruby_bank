require 'test_helper'

class BankAccountsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get bank_accounts_show_url
    assert_response :success
  end
end
