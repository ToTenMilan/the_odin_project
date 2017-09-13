class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @airport_options = Airport.all.map { |a| [ a.code, a.id ] }
    p "@@@@@@@@@@@@@@@@22222 params flight @@@@@@@@@@@@@@@@@@"
    p params[:flight]
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

    if params[:flight].nil?
      @flights = Flight.all
    else
      # @flights = Flight.where("destination_airport_id LIKE ?", "%#{params[:flight][:to_airport_id]}%")
      @flights = Flight.where(destination_airport_id: params[:flight][:to_airport_id])
    end

    p "!!!!!!!!!!!!!!!!!!!!!!!!!!! fights"
    p @flights
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"



    # @flights = if params.nil?
    #   Flight.all
    #   # Flight.where('destination_airport.code LIKE ?', "%#{params[:destination_airport]}%")}
    # else
    #   # params[:flight][:from_airport_id] &&
    #   #             params[:flight][:to_airport_id] &&
    #   #             params[:flight][:passengers] &&
    #   #             params[:flight][:flight_start]
    #   # p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2 params @@@@@@@@@@@@@@@@@@@@@@@@@"
    #   # p params[:controller][:flights]
    #   # p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

    #   Airport.where('id LIKE ?', "%#{params[:flights][:from_airport_id])}%")
    # end

    # @flights.each do |f|
    #    f.duration = Time.at(f.duration).utc.strftime("%H:%M:%S")
    # end
  end
end
