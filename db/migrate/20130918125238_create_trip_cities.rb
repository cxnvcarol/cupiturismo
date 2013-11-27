class CreateTripCities < ActiveRecord::Migration
  def change
    create_table :trip_cities do |t|

      t.string :city_name
      t.string :transport
      t.references :trip

      t.timestamps
    end
    add_index :trip_cities, :trip_id
  end
end
