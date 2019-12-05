class Hostel < ApplicationRecord
	has_many :bookings, dependent: :destroy
end
