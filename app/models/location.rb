# == Schema Information
#
# Table name: locations
#
#  id         :integer(4)      not null, primary key
#  latitude   :float
#  longitude  :float
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude
end



