class OrderMailer < ApplicationMailer

	def customer_confirmation(order)
		#sends an email to the customer to confirm their reservation
		@booking = Booking.find(order.booking_id)
		@user = User.find(@booking.user_id)
		@url  = '#'	#write the proper email adress
    	mail(to: @user.email, subject: 'Votre commande est enregistrée!')

	end

	def hostel_confirmation(order)
		#sends an email to the hostel/admin (us) to tell them we have a new reservation
		@order = order
		@user = User.find(@booking.user_id)
		@url  = '#' #write heroku adress
    	mail(to: 'thp.mtp.best.groupe@gmail.com', subject: 'Une commande a été passée!')

	end
end
