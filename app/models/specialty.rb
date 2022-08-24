class Specialty < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :title, :details, :price, presence: true
  validates :price, numericality: true

  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_localisation?
end
