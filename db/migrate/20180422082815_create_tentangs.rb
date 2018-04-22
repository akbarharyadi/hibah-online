class CreateTentangs < ActiveRecord::Migration[5.1]
  def change
    create_table :tentangs do |t|
      t.string :judul
      t.text :konten
      t.string :gambar

      t.timestamps
    end
  end
end
