class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_pic
      t.string :cropped_profile_pic
      t.string :specialized_in
      
      t.integer :race_id
      t.integer :skin_color_id
      t.string :phone_number
      
      t.text :description
      
      t.date :birthdate
      

      t.timestamps
    end
  end
end
