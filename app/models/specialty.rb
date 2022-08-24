class Specialty < ApplicationRecord
  belongs_to :user
  validates :title, :details, :price, presence: true
  validates :price, numericality: true
  has_many :reservations
end
