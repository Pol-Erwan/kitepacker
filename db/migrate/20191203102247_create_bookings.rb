class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
    	t.boolean :full_board
    	t.date :start_date
    	t.date :end_date
    	t.integer :bed_booked
      t.timestamps
    end
  end
end
