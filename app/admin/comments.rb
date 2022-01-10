ActiveAdmin.register Comment do
  permit_params :content, :user_id, :worship_id
end
