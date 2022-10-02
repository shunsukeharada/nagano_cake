class ChangeIsValidOfEndUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :end_users, :is_valid, :boolean, default: false
  end
  
  def down
    change_column :end_users, :is_valid, :boolean
  end
end
