class BookingsController < ApplicationController

  def new
    seats = (0...params[:seats].to_i).collect { |seat| Passenger.new }
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build(passengers: seats)
  end

  def create
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build(booking_params)
    if @booking.save
      redirect_to flight_booking_path(@booking)
    else
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:passengers, passengers_attributes: [:name, :email])
    end

end
