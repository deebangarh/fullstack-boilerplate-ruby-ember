class ChangeAmountToBalanceInAccounts < ActiveRecord::Migration[7.0]
  def change
    rename_column :accounts, :amount, :balance
  end
end
