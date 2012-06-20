class CreateAlohomoraOrganizations < ActiveRecord::Migration
  def change
    create_table :alohomora_organizations do |t|
      t.string :name
      t.integer :creator_id
      t.boolean :active
      t.integer :role_id
      t.timestamps
    end
  end
end
