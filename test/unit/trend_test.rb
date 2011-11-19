require 'test_helper'

class TrendTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

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

