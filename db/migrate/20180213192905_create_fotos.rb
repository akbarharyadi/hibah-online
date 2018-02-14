class CreateFotos < ActiveRecord::Migration[5.1]
  def change
    create_table :fotos do |t|
      t.references :hibah, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
