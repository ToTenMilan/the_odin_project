class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @airport_options = Airport.all.map { |a| [ a.code, a.id ] }

    @flights = if params[:flight].nil?
      Flight.all
    else
      start_date_param = params[:flight][:flight_start].in_time_zone('UTC')
      Flight.where(destination_airport_id: params[:flight][:to_airport_id], departure_airport_id: params[:flight][:from_airport_id], start: (start_date_param)..(start_date_param + 1.day))
    end

    # @flights = if params.nil?
    #   Flight.all
    #   # Flight.where('destination_airport.code LIKE ?', "%#{params[:destination_airport]}%")}
    # else
    #   # params[:flight][:from_airport_id] &&
    #   #             params[:flight][:to_airport_id] &&
    #   #             params[:flight][:passengers] &&
    #   #             params[:flight][:flight_start]

    #   Airport.where('id LIKE ?', "%#{params[:flights][:from_airport_id])}%")
    # end

    # @flights.each do |f|
    #    f.duration = Time.at(f.duration).utc.strftime("%H:%M:%S")
    # end
  end
end
