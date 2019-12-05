class Order < ApplicationRecord
	# after create an order we launch the function "send"

	#after_create :customer_email
	#after_create :administrator_email

	#def customer_email
  	#  OrderMailer.customer_confirmation(self, Booking.find(self.booking_id)).deliver_now
  	#end

  	#def administrator_email
  	# OrderMailer.hostel_confirmation(self, Booking.find(self.booking_id)).deliver_now
  	#end
end
