class ReservationsController < ApplicationController
	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reservation_params)
		@listing = @reservation.listing
		if (@reservation.reserved_dates &
				@listing.blocked_dates).empty? && @reservation.save
		flash[:notice]="booking successful"
		#Tell the ReservationMailer to send a welcome email after save
		ReservationMailer.booking_email(@reservation.user, @listing.user, @reservation.id).deliver_now
		redirect_to @reservation
		else 
		flash[:notice]="booking unsuccessful: check that dates are not already booked?"
		render :new	
		end
	end

	def show

	end

	def reservation_params
      params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date, :occupants, :comments)
    end

end
