# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all
Booking.destroy_all
User.destroy_all
Option.destroy_all
Hostel.destroy_all


user = []
hostel = []
option = []
booking = []

10.times do
	user << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,email: Faker::Name.first_name + "@yopmail.com", password:"ludovic")
end

10.times do
	hostel << Hostel.create(name: Faker::Name.first_name, city: Faker::Nation.capital_city,address: Faker::Address.street_address, zip_code: Faker::Address.zip_code, bed_number: rand(1..30), price: rand(1..200))
end

10.times do
	option << Option.create(start_date: Faker::Date.backward(days: 23),end_date: Faker::Date.forward(days: 23), price: rand(1..50))
end

10.times do
	booking << Booking.create(full_board: true, start_date: Faker::Date.backward(days: 23),end_date: Faker::Date.forward(days: 23), bed_booked: rand(1..5), user: user.sample, option: option.sample, hostel: hostel.sample)
end

10.times do
	Order.create(booking_id: booking.sample.id, final_price: rand(1..1000))
end
