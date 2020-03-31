class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.string :faa
      t.string :location
      t.string :name

      t.timestamps
    end
  end
end
