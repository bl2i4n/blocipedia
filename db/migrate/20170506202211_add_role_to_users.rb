class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :users, :role
  end
end
