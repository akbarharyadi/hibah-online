class CreateHomepages < ActiveRecord::Migration[5.1]
  def change
    create_table :homepages do |t|
      t.string :gambar_1
      t.text :text_1_1
      t.text :text_1_2
      t.text :text_1_3
      t.string :gambar_2
      t.text :text_2_1
      t.text :text_2_2
      t.string :gambar_3
      t.text :text_3_1
      t.text :text_3_2

      t.timestamps
    end
  end
end
