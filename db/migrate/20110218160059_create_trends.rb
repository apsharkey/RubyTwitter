class CreateTrends < ActiveRecord::Migration
  def self.up
    create_table :trends do |t|
      t.string :content
      t.integer :rank
      t.integer :times_used

      t.timestamps
    end
  end

  def self.down
    drop_table :trends
  end
end
