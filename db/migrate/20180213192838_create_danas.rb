class CreateDanas < ActiveRecord::Migration[5.1]
  def change
    create_table :danas do |t|
      t.references :hibah, foreign_key: true
      t.float :jumlah
      t.string :deskripsi

      t.timestamps
    end
  end
end
