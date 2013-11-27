class AddEndDateToTripCities < ActiveRecord::Migration
  def change
    add_column :trip_cities, :end_date, :datetime

  end
end
