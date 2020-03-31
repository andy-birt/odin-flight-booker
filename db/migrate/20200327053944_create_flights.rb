class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.references :airport, null: false, foreign_key: true
      t.datetime :departure
      t.integer :duration

      t.timestamps
    end
  end
end
