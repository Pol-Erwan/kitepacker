class AddColumnToOptionAndBooking < ActiveRecord::Migration[5.2]
  def change
  	add_column :bookings, :number_location, :integer
  	add_column :options, :attendees_number, :integer
  end
end
