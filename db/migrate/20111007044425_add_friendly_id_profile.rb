class AddFriendlyIdProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :slug, :string
    add_index :profiles, :slug, :unique => true
  end

  def down
    remove_column :profiles, :slug
    remove_index :profiles, :slug
  end
end
