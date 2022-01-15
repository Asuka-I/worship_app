class RenameTitleColumnToSeals < ActiveRecord::Migration[6.1]
  def change
    rename_column :seals, :title, :prefecture_id
  end
end
