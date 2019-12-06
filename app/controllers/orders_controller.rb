class OrdersController < ApplicationController
  def create
  	@booking = Booking.find(params[:booking_id])
  	@amount = 100

	customer = Stripe::Customer.create({
	email: params[:stripeEmail],
	source: params[:stripeToken],
	})

	charge = Stripe::Charge.create({
	customer: customer.id,
	amount: @amount * 100,
	description: 'Rails Stripe customer',
	currency: 'eur',
	})

	if charge
		Order.create(booking_id: @booking.id,final_price: @amount)
		flash[:sucess] = "Ta commande a bien été prise en compte !"
		redirect_to root_path
	end

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  #redirect_to new_charge_path(@event.id)
  end
end
