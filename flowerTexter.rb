require 'twilio-ruby'
require 'rufus-scheduler'
require 'dotenv/load'

def runner
  account_sid = ENV["TWILIO_SID"]
  auth_token = ENV["TWILIO_TOKEN"]

  flowers = ["🌷", "🌸", "🌹", "🌺", "🌻", "	🌼", "	💐", "💮"]

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.api.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['AMAN_NUMBER'],
      body: "Your flower of the day is ... "  + flowers.sample
  )
  @client.api.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['ERIN_NUMBER'],
      body: "Your flower of the day is ... "  + flowers.sample
  )
end

scheduler = Rufus::Scheduler.new

scheduler.cron '00 01 * * *', :first => :now  do
  runner()
end

scheduler.join
