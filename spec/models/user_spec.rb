require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create bank account when creating a user' do
    user = create(:user)
    expect(user.bank_account.user_id).to eq(user.id)
  end

  describe '#all_transactions' do
    it 'should return all user transactions' do
      sender = create(:user)
      recipient = create(:user)
      transaction = create(:transaction, amount: 10, sender:, recipient:)

      expect(sender.all_transactions).to eq([transaction])
      expect(recipient.all_transactions).to eq([transaction])
    end
  end
end
