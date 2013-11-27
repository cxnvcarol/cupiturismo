class AddTelephoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :Telephone, :string

  end
end
