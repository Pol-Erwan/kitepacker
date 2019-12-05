class LinkTable < ActiveRecord::Migration[5.2]
  def change
  	add_reference :bookings, :user, foreign_key: true, on_delete: :cascade
  	add_reference :bookings, :hostel, foreign_key: true, on_delete: :cascade
  	add_reference :bookings, :option, foreign_key: true, on_delete: :cascade
  	add_reference :orders, :booking, foreign_key: true, on_delete: :cascade
  end
end
