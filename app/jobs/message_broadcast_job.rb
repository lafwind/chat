class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                 { message_owner_id: message.user_id,
                                   message_for_current_user: render_message_for_current_user(message),
                                   message_for_others: render_message_for_others(message) }
  end

  private

  def render_message_for_current_user(message)
    ApplicationController.renderer.render partial: 'messages/message_by_current_user', locals: { message: message }
  end

  def render_message_for_others(message)
    ApplicationController.renderer.render partial: 'messages/message_by_others', locals: { message: message }
  end
end
