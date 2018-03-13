class AddRoleIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role_id, :integer
    add_column :users, :dina_id, :integer
  end
end
  