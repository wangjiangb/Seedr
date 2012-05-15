class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.integer :user_id
      t.boolean :active
      t.text :stream_url
      t.string :oauth_token
      t.string :oauth_token_secret
      t.string :oauth_token_verifier
      t.text :oauth_authorize_url

      t.timestamps
    end
  end
end
