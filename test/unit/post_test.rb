require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



# == Schema Information
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  content    :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  repost     :string(255)
#

