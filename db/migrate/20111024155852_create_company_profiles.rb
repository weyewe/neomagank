class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.text :description
      t.text :address
      t.string :logo_url
      
      t.integer :company_id

      t.timestamps
    end
  end
end
