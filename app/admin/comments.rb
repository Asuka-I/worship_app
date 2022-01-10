ActiveAdmin.register Comment do
  permit_params :content, :user_id, :worship_id

  filter :worship
  filter :user
  filter :content
end
