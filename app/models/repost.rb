# == Schema Information
#
# Table name: reposts
#
#  id          :integer(4)      not null, primary key
#  poster_id   :integer(4)
#  reposter_id :integer(4)
#  content     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Repost < ActiveRecord::Base
  attr_accessible :poster_id, :reposter_id, :content
  

  belongs_to :poster, :class_name => "User"
  belongs_to :reposter, :class_name => "User"
  
  validates :poster_id, :presence => true
  validates :reposter_id, :presence => true
  
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

      
  private
  
    def self.followed_by(user)
      followed_ids = %(SELECT followed_id FROM relationships
                       WHERE follower_id = :user_id)
      
      where("reposter_id IN (#{followed_ids}) OR reposter_id = :user_id",
            :user_id => user)
            
      
    end
    
    
end


