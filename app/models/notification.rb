class Notification < ActiveRecord::Base
  attr_accessible :content, :author

  belongs_to :user
end


# == Schema Information
#
# Table name: notifications
#
#  id         :integer(4)      not null, primary key
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer(4)
#  author     :string(255)
#

