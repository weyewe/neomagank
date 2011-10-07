class AddFriendlyIdPortfolio < ActiveRecord::Migration
  def up
    add_column :portfolios, :slug, :string
    add_index :portfolios, :slug, :unique => true
  end

  def down
    remove_column :portfolios, :slug
    remove_index :portfolios, :slug
  end
end
