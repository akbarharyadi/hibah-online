class CreatePeraturans < ActiveRecord::Migration[5.1]
  def change
    create_table :peraturans do |t|
      t.string :nama
      t.string :file

      t.timestamps
    end
  end
end
