class Reservation < ApplicationRecord
  belongs_to :specialty
  belongs_to :user
  validates :start_date, :end_date, :comment, presence: true
end
