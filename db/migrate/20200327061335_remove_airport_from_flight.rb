class RemoveAirportFromFlight < ActiveRecord::Migration[6.0]
  def change
    remove_reference :flights, :airport, null: false, foreign_key: true
  end
end
