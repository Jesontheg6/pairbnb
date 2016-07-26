class Reservation < ActiveRecord::Base
	belongs_to :listings
	belongs_to :users
end
