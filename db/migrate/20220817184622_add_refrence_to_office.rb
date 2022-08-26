class AddRefrenceToOffice < ActiveRecord::Migration[6.1]
  def change
    add_reference :offices, :user, :index => true
    add_reference :user_workflows , :office  , :index => true
  end
end
