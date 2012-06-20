class CreateScopes < ActiveRecord::Migration
  def change
    create_table :alohomora_scopes do |t|
      t.string :name
      t.string :uri

      t.timestamps
    end
  end
end
