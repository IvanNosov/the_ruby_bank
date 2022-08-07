require 'rails_helper'

RSpec.describe PerformTransactionService, type: :model do
  describe '#call' do
    let(:sender) { create(:user) }
    let(:recipient) { create(:user) }
    let(:params) { { amount: 20, sender_id: sender.id, recipient_id: recipient.id } }

    context 'valid data' do
      it 'should transfer money from sender to recipient' do
        sender.bank_account.update(balance: 100)

        transaction = PerformTransactionService.call(params)

        expect(transaction.persisted?).to eq(true)
        expect(sender.reload.bank_account.balance).to eq(80)
        expect(recipient.reload.bank_account.balance).to eq(20)
      end
    end

    context 'invalid data' do
      it 'should create not successful transaction if sender has not enough balance' do
        transaction = PerformTransactionService.call(params)

        expect(transaction.persisted?).to eq(true)
        expect(transaction.success).to eq(false)
        expect(sender.reload.bank_account.balance).to eq(0)
        expect(recipient.reload.bank_account.balance).to eq(0)
      end
    end
  end
end
