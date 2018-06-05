class CreateEvaluasi < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluasis do |t|
      t.integer :user_id
      t.integer :hibah_id 
      t.text :keterangan
      t.string :file_upload
    end
  end
end
