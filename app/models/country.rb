class Country < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :offices, through: :cities

  validates :name, presence: true, uniqueness: true
end
