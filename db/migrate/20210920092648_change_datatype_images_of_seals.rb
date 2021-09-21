class ChangeDatatypeImagesOfSeals < ActiveRecord::Migration[6.1]
  def change
    change_column :seals, :images, "json USING CAST(images AS json)"
  end
end
