class Flight < ApplicationRecord
  belongs_to :to_airport, class_name: "Airport"
  belongs_to :from_airport, class_name: "Airport"
  has_many :bookings
  validates :departure, presence: true
  validates :duration, presence: true
  validates :price, presence: true
end
