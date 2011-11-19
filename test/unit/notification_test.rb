require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

