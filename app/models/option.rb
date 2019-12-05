class Option < ApplicationRecord
	has_many :bookings, dependent: :destroy
end
