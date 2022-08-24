class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many_attached :photos
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations
  has_many :reviews
  has_many :specialties
  validates :first_name, :last_name, :birthdate, :description, :gender, :address, presence: true
  validates :description, length: { minimum: 100 }
  validate :old_enough?

  def old_enough?
    errors.add(:birthdate, "You should be over 18 years old.") unless (DateTime.now - birthdate).to_i >= 6570
  end
end
