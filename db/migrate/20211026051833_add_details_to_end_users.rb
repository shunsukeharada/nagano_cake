class AddDetailsToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :first_name, :string
    add_column :end_users, :last_name, :string
    add_column :end_users, :kana_first_name, :string
    add_column :end_users, :kana_last_name, :string
    add_column :end_users, :postal_code, :string
    add_column :end_users, :address, :string
    add_column :end_users, :phone_number, :string
    add_column :end_users, :is_valid, :boolean
  end
end
