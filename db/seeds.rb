# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = Airport.create([
  { faa: "CRW", location: "Charleston, WV", name: "Yeager Airport" },
  { faa: "RIC", location: "Richmond, VA", name: "Richmond International Airport" },
  { faa: "PBI", location: "Tampa, FL", name: "Tampa International Airport" },
  { faa: "HOU", location: "Houston, TX", name: "William P. Hobby Airport" },
  { faa: "JFK", location: "New York, NY", name: "John F. Kennedy International Airport" },
  { faa: "RDU", location: "Raleigh, NC", name: "Raleigh-Durham International Airport" },
  { faa: "BFI", location: "Seattle, WA", name: "King County International Airport" }
])

100.times do |n|
  airports.each do |airport|
    next if airports[n % 7] == airport
    Flight.create(
      departure: Time.now.advance(days: n).change(min: 0),
      duration: rand(1..10),
      to_airport: airports[n % 7],
      from_airport: airport,
      price: rand(30..240)
    )
  end
end