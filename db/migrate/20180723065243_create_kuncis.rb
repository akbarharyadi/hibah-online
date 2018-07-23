class CreateKuncis < ActiveRecord::Migration[5.1]
  def change
    create_table :kuncis do |t|
      t.string :msg_open
      t.string :msg_close
      t.integer :status
      t.date :start_date
      t.date :final_date

      t.timestamps
    end
  end
end
