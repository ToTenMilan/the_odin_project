class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :start
      t.string :duration
      t.references :destination_airport#, foreign_key: true
      t.references :departure_airport#, foreign_key: true

      t.timestamps
    end
  end
end
