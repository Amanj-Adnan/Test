class UserWorkflow < ApplicationRecord
    belongs_to :office
    has_many :users
    has_one :line_manager, foreign_key: 'line_manager_id', class_name: 'User'
    # around_create :update_user_workflow


    scope :hr_officers, ->{where('SELECT * FROM user_profiles WHERE position = %hr% ')}

    before_update do
        self.users.ids.each do |id|
            @user = User.find_by(id: id)
            @user.update!(user_workflow_id:0)
            end
    end

    # private
    #
    # def update_user_workflow
    #     puts('callback')
    #     puts(self.workflow_name)
    # end
end
