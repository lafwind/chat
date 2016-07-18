ActiveAdmin.register User do

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

  permit_params :name, :email

  menu priority: 2, label: "Users"

  index do
    column :name
    column :email
    column :role
    # column :current_sign_in_at
    column "Last sign in", :last_sign_in_at
    column :created_at
    actions
  end

end
