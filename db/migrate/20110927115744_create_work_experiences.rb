class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.string :company_name
      t.string :position
      t.string :type_of_employment
      t.text :description 
      t.date :starting_date
      t.date :ending_date
      
      
      t.integer :user_id 
      
      t.timestamps
    end
  end
end
