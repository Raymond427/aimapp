class AimMailer < ApplicationMailer
  default from: 'aimcharlotte@uncc.edu' #This is a hash of default values for any email you send from this mailer. In this case, we are setting the :from header to a value for all messages in this class. This can be overridden on a per-email basis

  def join_email
    @first_name = first_name
    @last_name = last_name
    @phone_number = phone_number
    @email = email
    @major = major
    @grad_date = grad_date
    @message = message
    mail(to: 'aimunccpresident@gmail.com', subject: '#{first_name} #{last_name} wants to join Advancing Innovative Minds!') #The actual email message, we are passing the :to and :subject headers in.
  end
end
