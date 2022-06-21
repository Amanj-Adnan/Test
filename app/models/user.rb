class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts , dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_one :leave, dependent: :destroy


  scope :without_user_profiles, -> { where('NOT EXISTS(SELECT 1 FROM user_profiles WHERE user_id = users.id)') }


end
