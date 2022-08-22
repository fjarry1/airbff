class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :user
  validates :content, :title, :rating, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
