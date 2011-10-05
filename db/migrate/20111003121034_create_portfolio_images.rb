class CreatePortfolioImages < ActiveRecord::Migration
  def change
    create_table :portfolio_images do |t|
      t.integer :portfolio_id
      t.string :image_type
      t.text :image_url
      t.boolean :is_first, :default => false
    

      t.timestamps
    end
  end
end
