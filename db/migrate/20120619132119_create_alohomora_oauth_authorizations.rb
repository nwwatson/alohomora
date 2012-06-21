class CreateAlohomoraOauthAuthorizations < ActiveRecord::Migration
  def change
    create_table :alohomora_oauth_authorizations do |t|
      t.string :client_uri
      t.string :resource_owner_uri
      t.string :code
      t.time :expired_at
      t.date :blocked

      t.timestamps
    end
  end
end
