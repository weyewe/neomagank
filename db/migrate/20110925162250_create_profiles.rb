class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :profile_pic
      t.string :cropped_profile_pic
      t.string :specialized_in
      
      t.string :race
      t.string :skin_color
      t.string :phone_number
      
      t.text :description
      
      t.date :birthdate
      
      
      t.integer :user_id

      t.timestamps
    end
  end
end
