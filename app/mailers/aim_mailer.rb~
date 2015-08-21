class AimMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.aim_mailer.join_now.subject
  #
  def join_now(aim_mailers)
    aim_mailers.type = 'join_now'
    @aim_mailers = aim_mailers
    @full_name = aim_mailers.first_name + ' ' + aim_mailers.last_name
    @email = @aim_mailers.email
    @message = @aim_mailers.message
    @phone_number = @aim_mailers.phone_number
    mail to: 'aimunccpresident@gmail.com', subject: '#{@full_name} + wants to join AIM!'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.aim_mailer.contact_us.subject
  #
  def contact_us(aim_mailers)
    aim_mailers.type = 'contact_us'
    @aim_mailers = aim_mailers
    @full_name = aim_mailers.first_name + ' ' + aim_mailers.last_name
    @subject = @aim_mailers.subject
    @email = @aim_mailers.email
    @message = @aim_mailers.message
    @company = @aim_mailers.company
    @phone_number = @aim_mailers.phone_number
    mail to: 'aimunccpresident@gmail.com', subject: @subject
end
