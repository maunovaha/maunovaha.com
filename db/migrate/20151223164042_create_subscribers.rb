class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email, null: false
      t.string :token, null: false
      t.boolean :active, null: false, default: false

      t.timestamps null: false

      t.index :email, unique: true
      t.index :token, unique: true
    end
  end
end
