class AddLocationToUser < ActiveRecord::Migration
  def self.up
     add_column :users, :status, :string
     add_column :users, :ip, :string
     add_column :users, :country_code, :string
     add_column :users, :country_name, :string
     add_column :users, :region_code, :integer
     add_column :users, :region_name, :string
     add_column :users, :city, :string
     add_column :users, :zip_postal_code, :integer
     add_column :users, :latitude, :float
     add_column :users, :longitude, :float
     add_column :users, :timezone_name, :string
     add_column :users, :utc_offset, :integer
     add_column :users, :dst, :string
  end

  def self.down
    remove_column :users, :status
    remove_column :users, :ip
    remove_column :users, :country_code
    remove_column :users, :country_name
    remove_column :users, :region_code
    remove_column :users, :region_name
    remove_column :users, :city
    remove_column :users, :zip_postal_code
    remove_column :users, :latitude
    remove_column :users, :longitude
    remove_column :users, :timezone_name
    remove_column :users, :utc_offset
    remove_column :users, :dst
  end
end
