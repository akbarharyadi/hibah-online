class AddGambarToHibas < ActiveRecord::Migration[5.1]
  def change
    add_column :hibahs, :gambar, :string
  end
end
