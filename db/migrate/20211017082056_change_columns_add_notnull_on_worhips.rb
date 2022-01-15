class ChangeColumnsAddNotnullOnWorhips < ActiveRecord::Migration[6.1]
  def change
    change_column_null :worships, :category, false
    change_column_null :worships, :prefecture_id, false
    change_column_null :worships, :place, false
    change_column_null :worships, :content, false
    change_column_null :worships, :date, false
  end
end
