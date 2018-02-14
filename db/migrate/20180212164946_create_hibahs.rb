class CreateHibahs < ActiveRecord::Migration[5.1]
  def change
    create_table :hibahs do |t|
      t.string :nama
      t.text :alamat
      t.string :judul_kegiatan
      t.text :latar_belakang
      t.text :maksud_dan_tujuan
      t.integer :status
      t.string :proposal
      t.integer :user_id
      t.integer :on_process

      t.timestamps
    end
  end
end
