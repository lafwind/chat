ActiveAdmin.register ChatRoom do

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

  permit_params :title, :user_id

  menu priority: 3, label: "Chat Rooms"

  scope :hot

  index do
    column :title do |chat_room|
      link_to chat_room.title, admin_chat_room_path(chat_room)
    end
    column :user
    column :messages_count
    column :created_at

    actions
  end

end
