class Distribusi < ActiveRecord::Migration[5.1]
  def change
    create_table :distribusis do |t|
      t.integer :dina_id
      t.text :keterangan
      t.integer :user_id
      t.integer :hibah_id

      t.timestamps
    end
  end
end
