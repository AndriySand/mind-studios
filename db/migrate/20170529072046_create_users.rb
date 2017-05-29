class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :last_sign_in_at
  end
end
