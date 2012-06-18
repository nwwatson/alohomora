class CreateAlohomoraClients < ActiveRecord::Migration
  def up
    create_table :alohomora_clients do |t|
      t.string        :uri,             null: false
      t.string        :name,            null: false
      t.references    :user,            null: false
      t.string        :secret           null: false
      t.string        :redirect_uri,    null: false
      t.string        :info
      t.string        :granted_times,   null: false,    default: 0
      t.string        :revoked_times,   null: false,    default: 0
      t.boolean       :blocked,         null: false,    default: false
    end
    
    add_index :alohomora_clients, :uri
    add_indes :alohomora_clients, :secret
  end

  def down
  end
end
