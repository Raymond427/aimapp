ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "uncc.edu",
    :user_name => "aimcharlotte@uncc.edu",
    :password => "A!mcharl0tte",
    :authentication => "plain",
    :enable_starttls_auto => true
}
