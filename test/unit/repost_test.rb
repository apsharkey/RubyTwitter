require 'test_helper'

class RepostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


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

