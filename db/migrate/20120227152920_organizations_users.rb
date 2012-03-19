class OrganizationsUsers < ActiveRecord::Migration
  def change
    create_table :organizations_users do |t|
      t.integer :user_id
      t.integer :organization_id
    end
  end
end
