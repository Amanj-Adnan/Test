class AddAreaToRole < ActiveRecord::Migration[7.0]
  def change
    add_column :roles , :country_id , :integer , :default => 0
    add_column :roles , :city_id , :text , array: true, default: []
    add_column :roles , :office_id , :text , array: true, default: []
  end
end
