class CreateUserWorkflows < ActiveRecord::Migration[6.1]
  def change
    create_table :user_workflows do |t|
      t.string :workflow_name
      t.string :workflow_manager
      t.timestamps
    end
  end
end
