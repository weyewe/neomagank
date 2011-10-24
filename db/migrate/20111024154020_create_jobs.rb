class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title 
      t.text :teaser
      t.text :description
      t.integer :status , :default => 0 # 0 for internship, 1 for part time, 2 for full time
      t.date :starting_date
      t.date :ending_date
      t.date :application_deadline
      

      t.timestamps
    end
  end
end
