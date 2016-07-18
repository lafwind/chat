ActiveAdmin.register Message do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  permit_params :body, :user_id, :chat_room_id

  menu priority: 4, label: "Messages"

  index do
    column :chat_room_id do |message|
      chat_room = ChatRoom.find(message.chat_room_id)
      link_to chat_room.title, admin_chat_room_path(chat_room)
    end
    column :user_id
    column :id
    column :body

    actions
  end


end
