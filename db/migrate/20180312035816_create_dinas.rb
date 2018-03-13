class CreateDinas < ActiveRecord::Migration[5.1]
  def change
    create_table :dinas do |t|
      t.string :code
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
