require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



# == Schema Information
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  username             :string(255)
#  first_name           :string(255)
#  last_name            :string(255)
#  about                :string(255)
#  website              :string(255)
#  photo_file_name      :string(255)
#  photo_content_type   :string(255)
#  photo_file_size      :integer(4)
#  photo_updated_at     :datetime
#  relationship_status  :string(255)
#  admin                :boolean(1)      default(FALSE)
#

