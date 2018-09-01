require 'twilio-ruby'
require 'rufus-scheduler'
require 'dotenv/load'

def texter(array, thing)
  account_sid = ENV["TWILIO_SID"]
  auth_token = ENV["TWILIO_TOKEN"]


  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  numbers = [ENV['AMAN_NUMBER'], ENV['ERIN_NUMBER']]

  numbers.each do |number|
    @client.api.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: number,
      body: "Your " + thing + " of the day is ... " + array.sample
      )
  end
end


scheduler = Rufus::Scheduler.new

scheduler.cron '00 01 * * *', :first => :now do
  texter(["🌷", "🌸", "🌹", "🌺", "🌻", " 🌼", "  💐", "💮"], "flowers")
end



scheduler.join
