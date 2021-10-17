class ChangeDatatypePrefectureIdOfWorships < ActiveRecord::Migration[6.1]
  def change
    change_column :worships, :prefecture_id, "integer USING CAST(prefecture_id AS integer)"
  end
end
