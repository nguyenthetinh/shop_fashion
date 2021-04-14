class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name,                                        index: true
      t.string :email,             null: false,              index: true, unique: true
      t.string :encrypted_password, null: false, default: ""

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email

      t.string :company
      t.string :address
      t.string :phone
      t.string :bank
      t.string :branch
      t.string :account_name
      t.string :account_number
      t.integer :account_type

      # Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end
    add_index :suppliers, :reset_password_token, unique: true
    add_index :suppliers, :confirmation_token,   unique: true
  end
end
