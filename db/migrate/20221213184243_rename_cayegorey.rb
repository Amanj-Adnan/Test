class RenameCayegorey < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories_permissions,:categories
  end
end
