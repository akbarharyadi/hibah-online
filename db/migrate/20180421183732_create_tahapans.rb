class CreateTahapans < ActiveRecord::Migration[5.1]
  def change
    create_table :tahapans do |t|
      t.string :icon
      t.string :judul
      t.text :deskripsi
      t.integer :homepage_id
      t.timestamps
    end
  end
end
