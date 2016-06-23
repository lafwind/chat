class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy


  def created_time
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def owner
    User.find(user_id)
  end
end
