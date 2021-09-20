class RenameImageColumnToSeal < ActiveRecord::Migration[6.1]
  def change
    rename_column :seals, :image, :images
  end
end
