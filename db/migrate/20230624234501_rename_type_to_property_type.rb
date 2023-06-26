class RenameTypeToPropertyType < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :type, :propertyType
  end
end
