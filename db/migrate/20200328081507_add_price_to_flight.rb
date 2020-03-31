class AddPriceToFlight < ActiveRecord::Migration[6.0]
  def change
    add_column :flights, :price, :integer
  end
end
