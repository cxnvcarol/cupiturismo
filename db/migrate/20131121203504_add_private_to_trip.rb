class AddPrivateToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :private, :boolean

  end
end
