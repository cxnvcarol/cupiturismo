class AddEndDateToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :end_date, :datetime

  end
end
