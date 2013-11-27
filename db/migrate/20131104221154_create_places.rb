class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :city
      t.integer :latitude
      t.integer :longitude
      t.integer :event_id

      t.timestamps
    end
  end
end
