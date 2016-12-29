# Actually just artificially changed the timestamp of this file to fix a database error.
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: false do |t|
      t.string :username, null: false

      t.string :name
      t.string :email, unique: true
      t.string :password_digest, unique: true
      t.string :remember_digest

      t.string :activation_digest
      t.boolean :activated, default: false
      t.datetime :activated_at

      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
