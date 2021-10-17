class RenameTitleColumnToWorships < ActiveRecord::Migration[6.1]
  def change
    rename_column :worships, :title, :prefecture_id
  end
end
