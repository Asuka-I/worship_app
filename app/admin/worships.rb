ActiveAdmin.register Worship do
  permit_params :category, :prefecture_id, :place, :content, :date, :images, :address, :likes_count, :user_id  
end
