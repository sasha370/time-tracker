namespace :notification do

  desc "Sends sms notification to user asking them to log if they had overtime or not"
  task sms: :environment do
    #
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end

  end

end
