# == Schema Information
#
# Table name: chat_rooms
#
#  id             :integer          not null, primary key
#  title          :string
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  messages_count :integer
#

require 'test_helper'

class ChatRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
