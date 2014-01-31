require 'bundler/setup'
require 'twilio-ruby'

class SimpleMessage
attr_reader :mobile

ACCOUNT_SID = 'AC72490e800531569ce92a9d9a249526c8'
AUTH_TOKEN = 'c2db25b603ce2e134f6074b0264bb6ba'
FROM = '+441986232036'

def initialize(mobile)
  @mobile = mobile
end

def twilio_app
    @twilio_app = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
end

  def simple_message
    twilio_app.account.sms.messages.create(
      :from => FROM,
      :to => @mobile,
      :body => message )
  end

  def an_hour_from_now
    (Time.now + 60 * 60).strftime("%H:%M")
  end

  def message
    "Thank you! Your order was placed and will be delivered before #{an_hour_from_now}"
  end

end
