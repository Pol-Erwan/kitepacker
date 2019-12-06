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
hostel_name = ["Banana Bungalow","Famara Surf","Miramar Hotel","La Coquille St Kite","Ride Academy","Hotel Kréole","Happy Island","El kito loco","Kite Verde","Urla surfing"]
hostel_city = ["Kahului","Lanzarote","Biarritz","Erquy","Montpellier","Rodrigues","Union Island","Tarifa","Santa Maria","Izmir"]
hostel_zip_code = ["96732","35340","64200","22430","34000","R2336","VC0470","11380","4111","35030"]
hostel_adress = ["310 N Market St"," 345 Avenue El Marinero","14 Quai De La Grande Plage","Boulevard De La Mer","2 Chemin Du Canal","2344 Port Sud-Est","2020 Grenadine Street","Carrer De Los Lances","145 R 15 Agosto","123 Fevzi Çakmak Cd"]

variable = 0

10.times do
	user << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,email: Faker::Name.first_name + "@yopmail.com", password:"ludovic")
end

10.times do
	hostel << Hostel.create(name: hostel_name[variable], city: hostel_city[variable],address: hostel_adress[variable], zip_code: hostel_zip_code[variable], bed_number: rand(1..30), price: rand(1..200))
variable = variable + 1
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
