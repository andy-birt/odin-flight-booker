class PassengerMailer < ApplicationMailer
  default from: 'donotreply@flightbooker.com'

  def booking_confirmation
    @user = params[:user]
    mail(to: @user.email, subject: 'Booking Confirmation')
  end

end
