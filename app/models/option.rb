class Option < ApplicationRecord
	has_many :bookings, dependent: :destroy

	  def start_time
        self.start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end
end
