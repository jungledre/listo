class AddVenueAndLocationToEvent < ActiveRecord::Migration
  def change
    add_column :events, :venue, :string
    add_column :events, :location, :string
  end
end
