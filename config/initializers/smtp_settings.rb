# if Rails.env.development?

# all_smtp_config = YAML.load_file(File.join( Rails.root, 'config', 'smtp.yml'))
# current_smtp_config = all_smtp_config[Rails.env]

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "joseph.borremans@gmail.com",
  # :password             => current_smtp_config['jborremans'],
  :password             => ENV['GMAIL_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

# end