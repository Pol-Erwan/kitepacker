class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :hostel, optional: true
	belongs_to :option, optional: true
end
