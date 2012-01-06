  class Rates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.references :user
      t.references :artical
      t.timestamps
    end
  end

  def self.down
    drop_table :rates
  end
end
