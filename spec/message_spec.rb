require 'spec_helper'

describe SimpleMessage do 

	let(:simplemessage) {SimpleMessage.new('+447817212078')}
	let(:twilio_client) {double :twilio_client}

	it "accesses the twilio api" do
		expect(Twilio::REST::Client).to receive(:new).and_return(twilio_client)
		expect(simplemessage.twilio_app).to eq twilio_client
	end
	
	it 'sends correct delivery time for one hour after order was placed' do
      @time_now = Time.new(1,1,1,17)
      Time.stub!(:now).and_return(@time_now)
      expect(simplemessage.an_hour_from_now).to eq("18:00")
      expect(simplemessage.message).to eq("Thank you! Your order was placed and will be delivered before 18:00")
  end

end

