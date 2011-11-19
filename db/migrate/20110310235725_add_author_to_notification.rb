class AddAuthorToNotification < ActiveRecord::Migration
  def self.up
    add_column :notifications, :author, :string
  end

  def self.down
    remove_colum :notifications, :author
  end
end
