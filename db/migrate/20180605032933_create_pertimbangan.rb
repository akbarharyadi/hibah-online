class CreatePertimbangan < ActiveRecord::Migration[5.1]
  def change
    create_table :pertimbangans do |t|
      t.integer :user_id
      t.integer :hibah_id
      t.integer :status
      t.text :keterangan
      t.float :realisasi
      t.string :file
    end
  end
end
