require 'twilio-ruby'
require 'dotenv/load'

account_sid = ENV["TWILIO_SID"]
auth_token = ENV["TWILIO_TOKEN"]

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.api.account.messages.create(
    from: ENV['TWILIO_NUMBER'],
    to: ENV['AMAN_NUMBER'],
    body: 'Hey there!'
)