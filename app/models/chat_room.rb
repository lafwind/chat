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

  scope :recent, -> (n) { order(created_at: :DESC).limit(n) }
  scope :hot, -> { where("messages_count >= ?", 20) }

  # For will_paginate
  self.per_page = 10

  def created_time
    created_at.strftime('%H:%M %d %B %Y')
  end

  def owner
    User.find(user_id)
  end
end
