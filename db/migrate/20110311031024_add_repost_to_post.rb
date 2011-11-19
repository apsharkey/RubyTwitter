class AddRepostToPost < ActiveRecord::Migration
  def self.up
        add_column :posts, :repost, :string
  end

  def self.down
      remove_column :posts, :repost
  end
end
