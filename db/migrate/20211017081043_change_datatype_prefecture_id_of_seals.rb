class ChangeDatatypePrefectureIdOfSeals < ActiveRecord::Migration[6.1]
  def change
    change_column :seals, :prefecture_id, "integer USING CAST(prefecture_id AS integer)"
  end
end
