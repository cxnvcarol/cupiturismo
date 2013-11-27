class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :tittle
      t.datetime :begin_date
      t.integer :user_id
      t.references :user

      t.timestamps
    end
    add_index :trips, :user_id
  end
end
