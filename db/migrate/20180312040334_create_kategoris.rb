class CreateKategoris < ActiveRecord::Migration[5.1]
  def change
    create_table :kategoris do |t|
      t.string :name
      t.integer :dina_id

      t.timestamps
    end
  end
end
