class Specialty < ApplicationRecord
  belongs_to :user
  has_many :reservations
  # has_many :users
  validates :title, :details, :price, presence: true
  validates :price, numericality: true

  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_localisation?
  include PgSearch::Model
  multisearchable against: [:title, :details]
end
