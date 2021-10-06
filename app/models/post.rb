class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy


  delegate :email , to: :user
end
