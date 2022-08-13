class UserWorkflow < ApplicationRecord
    belongs_to :office
    has_many :users
end
