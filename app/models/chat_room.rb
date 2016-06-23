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

class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: true;

  def created_time
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def owner
    User.find(user_id)
  end
end
