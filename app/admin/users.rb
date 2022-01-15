ActiveAdmin.register User do
  permit_params :name, :email, :avatar, :introduce, :password, :password_confirmation

  filter :name
  filter :email
  filter :introduce
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
end
