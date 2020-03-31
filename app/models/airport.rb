class Airport < ApplicationRecord
  has_many :departing_flights, class_name: "Flight", foreign_key: :from_airport_id
  has_many :arriving_flights, class_name: "Flight", foreign_key: :to_airport_id
  validates :faa, presence: true, length: { is: 3 }
  validates :location, presence: true
  validates :name, presence: true
end
