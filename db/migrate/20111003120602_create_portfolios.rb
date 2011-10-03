class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :teaser
      t.text :teaser_image_url
      t.text :show_image_url
      

      t.timestamps
    end
  end
end
