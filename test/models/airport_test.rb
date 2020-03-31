require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  
  def setup
    @airport = Airport.new(faa: "CRW", location: "Charleston, WV", name: "Yeager Airport")
  end

  test "should be valid" do
    assert @airport.valid?
  end

  test "faa should not be empty" do
    @airport.faa = ""
    assert_not @airport.valid?
  end

  test "faa should only have three characters" do
    @airport.faa = "A"
    assert_not @airport.valid?
    @airport.faa = "AA"
    assert_not @airport.valid?
    @airport.faa = "AAAA"
    assert_not @airport.valid?
  end

  test "location should not be empty" do
    @airport.location = ""
    assert_not @airport.valid?
  end

  test "name should not be empty" do
    @airport.name = ""
    assert_not @airport.valid?
  end

end
