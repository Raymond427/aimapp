class AimMailer < ActiveRecord::Base
after_save :send_mail

def send_mail
  if type == 'contact_us'
    AimMailer.contact_us(self).deliver
  else if type == 'join_now'
    AimMailer.join_now(self).deliver
  end
end
