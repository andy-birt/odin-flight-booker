class FlightsController < ApplicationController

  def index
    if params[:from_airport] and params[:to_airport]
      @flights = Flight.where(from_airport: Airport.find_by(location: params[:from_airport][:location]), 
                                  to_airport: Airport.find_by(location: params[:to_airport][:location]))
    end
  end

end
