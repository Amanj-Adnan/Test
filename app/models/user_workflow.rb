class UserWorkflow < ApplicationRecord
    has_many :work_ins
    has_many :users , through: :work_ins
end
