class ReservationMailer < ApplicationMailer
default from: "yapjiaqing@gmail.com"

 def booking_email(customer, host, reservation_id)
    @customer = customer
    @host = host
    @reservation_id = reservation_id

    mail(to: @host.email, subject: 'Pairbnb Booking Confirmation')
  end

end
