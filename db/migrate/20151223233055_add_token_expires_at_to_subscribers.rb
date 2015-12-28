class AddTokenExpiresAtToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :token_expires_at, :timestamp, null: false
  end
end
