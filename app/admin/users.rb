ActiveAdmin.register User do
  permit_params :name, :email, :avatar, :introduce  
end
