class CreateClients < ActiveRecord::Migration
  def change
    create_table :alohomora_clients do |t|
      t.string :uri
      t.string :name
      t.integer :created_from
      t.string :secret
      t.string :site_uri
      t.string :redirect_uri
      t.string :info
      t.integer :granted_times
      t.integer :revoked_times
      t.date :blocked

      t.timestamps
    end
  end
end
