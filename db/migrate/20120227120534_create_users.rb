class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string        :uri,             null: false
      t.string        :email,           null: false
      t.boolean       :admin,           null: false,        default: true
      t.string        :password_digest  null: false
      t.timestamps
    end
    
    add_index :users, :email
  end
end
