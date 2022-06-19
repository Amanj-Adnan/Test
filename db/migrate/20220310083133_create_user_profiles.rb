class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :nmae
      t.string :adress
      t.date :date_of_berth

      t.date :start_date
      t.date :end_of_contarct
      t.timestamps
    end
  end
  
end
