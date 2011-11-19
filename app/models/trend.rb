# == Schema Information
#
# Table name: trends
#
#  id         :integer(4)      not null, primary key
#  content    :string(255)
#  rank       :integer(4)
#  times_used :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Trend < ActiveRecord::Base
  attr_accessible :times_used, :content, :rank

  
end



