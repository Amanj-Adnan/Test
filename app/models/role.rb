class Role < ApplicationRecord
  belongs_to :super_user
  has_many :permissions , dependent: :destroy
end
