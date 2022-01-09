ActiveAdmin.register Seal do

permit_params :category, :prefecture_id, :place, :date, :images, :address, :likes_count
end
