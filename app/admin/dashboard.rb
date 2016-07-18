ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #

    columns do
      panel "Info" do
        para "Welcome to ActiveAdmin."
      end
    end

    columns do
      panel "Recent Chatrooms" do
        ul do
          ChatRoom.recent(5).map do |chat_room|
            li link_to(chat_room.title, admin_chat_room_path(chat_room))
          end
        end
        strong { link_to "View All Chatrooms", admin_chat_rooms_path }
      end

    end
  end # content
end
