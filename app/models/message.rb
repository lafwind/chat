# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  body         :text
#  user_id      :integer
#  chat_room_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room, counter_cache: true

  validates :body,
            presence: true,
            length: {
              minimum: 2,
              maximum: 999
            }

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
