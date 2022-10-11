class Attendance < ApplicationRecord
  belongs_to :user

  include PgSearch::Model


  pg_search_scope :global_search,
                  against: [:user_id],
                  associated_against: {
                    user: [:email]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }


  # def self.to_csv()
  #   attributes= %w{user_id name date exception}
  #   CSV.generate(headers: true ) do |csv|
  #     csv<< attributes
  #
  #     all.each do |attendance|
  #       csv<<attendance.attributes.values_at(*attributes)
  #
  #     end
  #
  #   end
  # end





end
