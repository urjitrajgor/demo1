class AddAvatarColumsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar_image, :binary
  end

  def self.down
    remove_coloum :users, :avatar_image
  end
end
