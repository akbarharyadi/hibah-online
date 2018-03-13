class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :nama_lengkap
      t.string :no_telp
      t.string :foto
      t.integer :jenis_kelamin
      t.string :organisasi
      t.integer :user_id

      t.timestamps
    end
  end
end
