# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => '82ce7144c2667c',
    :password => '71a2e1a789352b',
    :address => 'smtp.mailtrap.io',
    :domain => 'smtp.mailtrap.io',
    :port => '2525',
    :authentication => :cram_md5
}
ActionMailer::Base.delivery_method = :smtp