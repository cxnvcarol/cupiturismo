class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :begin_date
      t.string :description
      t.datetime :end_date
      t.integer :id
      t.string :name
      t.string :picture_link
      t.float :rating
      t.references :trip_city

      t.timestamps
    end
    add_index :events, :trip_city_id
  end
end
