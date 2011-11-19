class AddRelationshipStatusToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :relationship_status, :string
  end

  def self.down
    remove_column :users, :photo_file_name, :string
  end
end
