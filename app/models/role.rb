class Role < ApplicationRecord
  belongs_to :super_user
  has_and_belongs_to_many :permissions
end
