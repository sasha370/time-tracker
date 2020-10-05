module SmsTool

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  @client = Twilio::REST::Client.new( account_sid, auth_token)

  def self.send_sms(number:, message:)

    @client.messages.create(
        from: '+12096006734',
        to: "+79063682969",  # в это место можно вписать number? в том случае, если купить полноценный Акк Twilio
        body: "#{message} from TimeTracker"
    )
    puts "Sending SMS i OK!!!"
  end

end
