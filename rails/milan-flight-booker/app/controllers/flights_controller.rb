class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @airport_options = Airport.all.map { |a| [ a.code, a.id ] }
    @flights = Flight.all



    # @flights = if params[:destination_airport]
    #   Flight.where('destination_airport.code LIKE ?', "%#{params[:destination_airport]}%")
    # else
    #   Flight.all
    # end

    # @flights.each do |f|
    #    f.duration = Time.at(f.duration).utc.strftime("%H:%M:%S")
    # end
  end
end
