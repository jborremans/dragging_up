# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DraggingUp::Application.initialize!

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'joseph.borremans',
  :password             => 'jborremansXXXXXX',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }
