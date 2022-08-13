class City < ApplicationRecord
  belongs_to :country
  has_many :offices, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
