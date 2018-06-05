class CreateSeleksis < ActiveRecord::Migration[5.1]
  def change
    create_table :seleksis do |t|
      t.integer :status
      t.text :keterangan
      t.integer :user_id
      t.integer :hibah_id

      t.timestamps
    end
  end
end
