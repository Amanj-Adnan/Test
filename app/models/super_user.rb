class SuperUser < ApplicationRecord
  has_one :role, dependent: :destroy

end
