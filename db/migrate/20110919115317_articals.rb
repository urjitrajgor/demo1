class Articals < ActiveRecord::Migration
  def self.up
    create_table :articals do |t|
      t.references :user
      t.string :name
      t.string :topic
      t.text :description
      t.boolean :published
      t.integer :rate
      
      
      t.timestamps

    end
  end

  def self.down
    drop_table :articals
  end
end
