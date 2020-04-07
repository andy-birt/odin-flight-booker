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
      @booking.passengers.each do |passenger|
        PassengerMailer.with(user: passenger).booking_confirmation.deliver_now!
      end
      redirect_to flight_booking_path(@booking.flight_id, @booking)
    else
      render "new"
    end
  end

  def show
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:passengers, passengers_attributes: [:name, :email])
    end

end
