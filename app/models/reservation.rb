class Reservation < ApplicationRecord
  belongs_to :specialty
  belongs_to :user
  validates :date, :comment, presence: true
end
