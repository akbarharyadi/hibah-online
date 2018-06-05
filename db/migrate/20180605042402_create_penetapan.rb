class CreatePenetapan < ActiveRecord::Migration[5.1]
  def change
    create_table :penetapans do |t|
      t.integer :user_id
      t.integer :hibah_id
      t.date :tgl_ketetapan
    end
  end
end
