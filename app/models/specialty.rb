class Specialty < ApplicationRecord
  belongs_to :user
  has_one :reservation
  validates :title, :details, :price, presence: true
  validates :price, numericality: true
end
