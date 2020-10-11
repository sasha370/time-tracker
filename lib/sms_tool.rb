module SmsTool

  account_sid = 'ACe0cdc762b8da82d970f05ef275a1e035'
  auth_token = '1df39b165f9798a57be0b8f9148944af'
  @client = Twilio::REST::Client.new( account_sid, auth_token)

  def self.send_sms(message)

    @client.messages.create(
        from: "+12096006734",
        to: "+79063682969",  # в это место можно вписать number? в том случае, если купить полноценный Акк Twilio
        body: "#{message}"
    )
    puts "Sending SMS i OK!!!"
  end

end
