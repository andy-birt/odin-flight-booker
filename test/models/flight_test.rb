require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  
  def setup
    @from_airport = Airport.new(faa: "AAA", location: "origin", name: "begin")
    @to_airport = Airport.new(faa: "BBB", location: "destination", name: "end")
    @flight = Flight.new(departure: "2020-03-30 10:00:00", duration: 5,  price: 200, to_airport: @to_airport, from_airport: @from_airport)
  end

  test "should be valid" do
    assert @flight.valid?
  end

  test "should have a departure" do
    @flight.departure = ""
    assert_not @flight.valid?
  end

  test "should have a duration" do
    @flight.duration = nil
    assert_not @flight.valid?
  end

  test "should have a price" do
    @flight.price = nil
    assert_not @flight.valid?
  end

  test "to_airport should exist" do
    @flight.to_airport = nil
    assert_not @flight.valid?
  end

  test "from_airport should exist" do
    @flight.from_airport = nil
    assert_not @flight.valid?
  end

end
