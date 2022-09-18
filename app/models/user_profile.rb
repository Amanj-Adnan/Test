class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :nmae,:start_date,:position,:date_of_berth,:adress,:educational_degree,
            :user_id,:end_of_contarct,:monthly_salary,:working_city,
            :working_country,:gender,presence: true
end
