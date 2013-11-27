class AddEventfulIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :EventfulId, :string

  end
end
