class UserWorkflow < ApplicationRecord
    belongs_to :office
    has_many :users
    # around_create :update_user_workflow


    scope :hr_officers, ->{where('SELECT * FROM user_profiles WHERE position = %hr% ')}

    # private
    #
    # def update_user_workflow
    #     puts('callback')
    #     puts(self.workflow_name)
    # end
end
