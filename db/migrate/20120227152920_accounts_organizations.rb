class AccountsOrganizations < ActiveRecord::Migration
  def change
    create_table :accounts_organizations do |t|
      t.integer :account_id
      t.integer :organization_id
    end
  end
end
