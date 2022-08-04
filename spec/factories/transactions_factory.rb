FactoryBot.define do
  factory(:transaction) do
    amount {}
    sender_id {}
    recipient_id {}
    success { false }
  end
end