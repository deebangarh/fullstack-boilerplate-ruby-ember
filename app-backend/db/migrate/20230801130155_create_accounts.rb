class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :accountid
      t.integer :amount

      t.timestamps
    end
  end
end
