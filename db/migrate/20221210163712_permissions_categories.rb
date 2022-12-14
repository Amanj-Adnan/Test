class PermissionsCategories < ActiveRecord::Migration[7.0]
  create_table :permissions_categories do |t|
    t.references :category, null: false, foreign_key: true, index: true
    t.references :permission, null: false, foreign_key: true , index: true
    t.timestamps
  end
end
