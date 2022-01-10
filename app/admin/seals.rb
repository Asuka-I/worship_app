ActiveAdmin.register Seal do
  permit_params :category, :prefecture_id, :place, :date, :images, :address, :likes_count, :likes_count, :user_id

  form do |f|
    f.inputs "Seals" do
      f.input :user
      f.input :category, as: :select, collection: ["寺", "神社"]
      f.input :prefecture
      f.input :place
      f.input :address
      f.input :date
      f.input :images, as: :file
    end
    f.actions
  end

  filter :user
  filter :category, as: :select, collection: ["寺", "神社"]
  filter :prefecture
  filter :place
  filter :address
  filter :date
end
