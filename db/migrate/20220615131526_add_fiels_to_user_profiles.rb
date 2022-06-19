class AddFielsToUserProfiles < ActiveRecord::Migration[6.1]
  def change

    add_column :user_profiles, :monthly_salary, :integer
    add_column :user_profiles, :educational_degree, :string
    add_column :user_profiles, :position, :string
    add_column :user_profiles, :working_city, :string
    add_column :user_profiles, :working_country, :string
    add_column :user_profiles, :working_office, :string
    add_column :user_profiles, :line_manager, :string

  end
end
