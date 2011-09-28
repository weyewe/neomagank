class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :institution_name
      t.date :starting_date
      t.date :ending_date
      t.text :description
      t.string :degree
      
      t.integer :user_id

      t.timestamps
    end
  end
end
