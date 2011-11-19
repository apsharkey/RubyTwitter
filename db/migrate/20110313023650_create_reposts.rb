class CreateReposts < ActiveRecord::Migration
  def self.up
    create_table :reposts do |t|
      t.integer :poster_id
      t.integer :reposter_id
      
      t.string :content
      
      t.timestamps
    end
    add_index :reposts, :poster_id
    add_index :reposts, :reposter_id
  end

  def self.down
    drop_table :reposts
  end
end
