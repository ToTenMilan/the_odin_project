class Flight < ApplicationRecord
  belongs_to :destination_airport, class_name: "Airport"
  belongs_to :departure_airport, class_name: "Airport"
end
