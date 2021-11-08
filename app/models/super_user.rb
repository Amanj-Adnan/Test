class SuperUser < ApplicationRecord
  has_many :roles , dependent: :destroy
end
