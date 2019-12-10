class AddColumnIsPaidBooking < ActiveRecord::Migration[5.2]
  def change
  	add_column :bookings, :is_paid, :boolean
  end
end
