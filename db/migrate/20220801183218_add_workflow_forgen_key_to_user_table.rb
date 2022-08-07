class AddWorkflowForgenKeyToUserTable < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :user_workflow, foreign_key: true
  end
end
