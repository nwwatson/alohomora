class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.integer :user_id
      t.integer :organization_id
      t.string :verification_code
      t.datetime :verified_at
      t.datetime :verified_sent_at
      t.timestamps
    end
  end
end
