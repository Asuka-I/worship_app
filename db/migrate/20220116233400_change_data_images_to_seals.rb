class ChangeDataImagesToSeals < ActiveRecord::Migration[6.1]
  def change
    change_column :seals, :images, :json
  end
end
