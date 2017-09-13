class Flight < ApplicationRecord
  attribute :duration, :duration
  belongs_to :destination_airport, class_name: "Airport"
  belongs_to :departure_airport, class_name: "Airport"

  def flight_date_formatted
    self.start.strftime("%m/%d/%Y")
  end
end
