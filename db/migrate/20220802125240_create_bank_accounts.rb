class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.integer :balance, default: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end
