class RemoveWorkflowForgenKeyToUserTable < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :user_workflow, foreign_key: true
  end
end
