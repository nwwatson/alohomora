class InitializeAlohomora < ActiveRecord::Migration[5.2]
  def change

    create_table :access_grants do |t|
      t.integer  :user_id, null: false
      t.string   :token,             null: false
      t.datetime :expires_at,        null: false
      t.datetime :revoked_at
      t.datetime :created_at,        null: false
    end

    create_table :access_tokens do |t|
      t.integer  :user_id
      t.string   :token,                  null: false
      t.string   :refresh_token
      t.datetime :expires_at,              null: false
      t.datetime :revoked_at
      t.datetime :created_at,             null: false
      t.string   :scopes
      t.string   :previous_refresh_token, null: false, default: ""
    end

    create_table :accounts do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.boolean :active
      t.integer :created_by_id, limit: 8
      t.timestamps
    end

    create_table :account_users do |t|
      t.integer :account_id, null: false
      t.integer :user_id, null: false
      t.boolean :default, default: true
      t.integer :role
    end

    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :time_zone, null: false, default: "America/New_York"
      t.string :locale, null: false, default: :en

      t.timestamps
    end

    ############################################################################
    # Foriegn Keys
    ############################################################################
    # Foreign Keys for access_grants
    add_foreign_key :access_grants,
                    :users,
                    column: :user_id,
                    name: 'fk_access_grants_users_user_id',
                    on_delete: :cascade

    # Foreign Keys for access_tokens
    add_foreign_key :access_tokens,
                    :users,
                    column: :user_id,
                    name: 'fk_access_tokens_users_user_id',
                    on_delete: :cascade

    # Foreign Keys for account_users
    add_foreign_key :account_users,
                    :accounts,
                    name: 'fk_account_users_accounts_account_id',
                    on_delete: :cascade

    add_foreign_key :account_users,
                    :users,
                    name: 'fk_account_users_users_user_id',
                    on_delete: :cascade

    # Foreign Keys for accounts
    add_foreign_key :accounts,
                    :users,
                    name: 'fk_accounts_users_created_by_id',
                    column: :author_id,
                    on_delete: :cascade

    ############################################################################
    # Add Indexes
    ############################################################################
    add_index :access_grants, :user_id, name: 'idx_access_grants_on_user_id', using: :btree
    add_index :access_grants, :token, name: 'idx_access_grants_on_token', using: :btree
    add_index :access_tokens, :user_id, name: 'idx_access_tokens_on_user_id', using: :btree
    add_index :access_tokens, :token, name: 'idx_access_tokens_on_token', using: :btree
    add_index :accounts, :active, name: 'idx_accounts_on_active', using: :btree
    add_index :accounts, :created_at, name: 'idx_accounts_created_at', using: :btree
    add_index :accounts, :slug, name: 'idx_accounts_on_slug', unique: true, using: :btree
    add_index :account_users, :account_id, name: 'idx_account_users_on_account_id', using: :btree
    add_index :account_users, :user_id, name: 'idx_account_users_on_user_id', using: :btree
    add_index :account_users, :default, name: 'idx_account_users_on_default', using: :btree

  end
end
