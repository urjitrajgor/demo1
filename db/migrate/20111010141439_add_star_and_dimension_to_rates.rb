class AddStarAndDimensionToRates < ActiveRecord::Migration
  def self.up
    add_column :rates, :star, :integer
    add_column :rates, :dimension, :string
  end

  def self.down
    remove_column :rates, :star
    remove_column :rates, :dimension
  end
end
