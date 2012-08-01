#ActionMailer config
ActionMailer::Base.smtp_settings = {
  :address              => ENV["SMTP_ADDRESS"],
  :port                 => Integer(ENV["SMTP_PORT"]),
  :domain               => 'gephi.org',
  :user_name            => ENV["SMTP_EMAIL"],
  :password             => ENV["SMTP_PASSWORD"],
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}
