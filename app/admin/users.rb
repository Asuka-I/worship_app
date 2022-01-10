ActiveAdmin.register User do
  permit_params :name, :email, :avatar, :introduce, :password, :password_confirmation 
end
