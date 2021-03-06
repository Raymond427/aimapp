class GuestMailer < ApplicationMailer
  default from: 'aimcharlotte@uncc.edu'

  def new_member_email(guest)
    @guest = guest
    mail to: 'aimunccpresident@gmail.com', subject: '#{@full_name} + wants to join AIM!'
  end

  def corporate_email(guest)
    @guest = guest
    mail to: 'aimunccpresident@gmail.com', subject: @guest.subject
  end

end
