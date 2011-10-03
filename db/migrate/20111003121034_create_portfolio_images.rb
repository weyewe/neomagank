class CreatePortfolioImages < ActiveRecord::Migration
  def change
    create_table :portfolio_images do |t|
      t.integer :portfolio_id
      t.text :image_url
      t.text :show_image_url
      t.text :teaser_image_url
      t.string :teaser

      t.timestamps
    end
  end
end
