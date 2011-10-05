class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :teaser

      

      t.timestamps
    end
  end
end
