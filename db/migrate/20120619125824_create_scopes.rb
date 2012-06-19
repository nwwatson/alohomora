class CreateScopes < ActiveRecord::Migration
  def change
    create_table :scopes do |t|
      t.string :name
      t.string :uri

      t.timestamps
    end
  end
end
