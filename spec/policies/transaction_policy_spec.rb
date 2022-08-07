require 'rails_helper'

RSpec.describe TransactionPolicy, type: :model do
  describe '#call' do
    let(:sender) { create(:user) }
    let(:recipient) { create(:user) }

    before do
      sender.bank_account.update(balance: 1000)
      recipient.bank_account.update(balance: 1000)
    end

    context 'valid data' do
      it 'should allow transaction' do
        allowed = TransactionPolicy.allowed?(sender, recipient, 10)

        expect(allowed).to eq(true)
      end
    end

    context 'invalid data' do
      it 'should not allow transaction with negative amount' do
        allowed = TransactionPolicy.allowed?(sender, recipient, -10)

        expect(allowed).to eq(false)
      end

      it 'should not allow transaction with same users' do
        allowed = TransactionPolicy.allowed?(sender, sender, 10)

        expect(allowed).to eq(false)
      end
    end
  end
end
