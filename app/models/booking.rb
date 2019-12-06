class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :hostel, optional: true
	belongs_to :option, optional: true

	  def start_time
        self.start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
   	 end

    def end_time
    	self.end_date
    end
end
