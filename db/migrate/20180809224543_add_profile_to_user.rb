class AddProfileToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar, :string
    add_column :users, :nama_ketua, :string
    add_column :users, :alamat, :text
    add_column :users, :nomor_telp, :string
    add_column :users, :activate, :integer
    add_column :users, :nama_organisasi, :string
  end
end
