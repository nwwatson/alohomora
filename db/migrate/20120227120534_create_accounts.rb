class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :verification_code
      t.timestamps
    end
  end
end
