# Preview all emails at http://localhost:3000/rails/mailers/aim_mailer
class AimMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/aim_mailer/join_now
  def join_now
    AimMailer.join_now
  end

  # Preview this email at http://localhost:3000/rails/mailers/aim_mailer/contact_us
  def contact_us
    AimMailer.contact_us
  end

end
