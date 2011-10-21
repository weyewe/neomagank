class AddIsCroppingToProfilePic < ActiveRecord::Migration
  def change
    add_column :profiles, :is_cropping, :boolean, :default => false
  end
end
