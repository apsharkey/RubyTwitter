require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: relationships
#
#  id          :integer(4)      not null, primary key
#  follower_id :integer(4)
#  followed_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

