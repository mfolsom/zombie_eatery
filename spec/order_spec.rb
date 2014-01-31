require 'spec_helper'

describe Order do 

  let(:order) {Order.new}
  let(:simplemessage) {SimpleMessage.new('+441234567890')}
  let(:twilio_client) {double :twilio_client}

  it "adds a line_item to an order" do
  	# dish1 = Dish.new(:fresh_brains, 15)
    order.add_item(:fresh_brains, 15, 1)
    expect(order.line_item).to include(:fresh_brains)
  end

  it "gets the total for each item" do
    order.add_item(:fresh_brains, 15, 1)
    expect(order.order_total).to eq(15)
  end

  it "adds up all items to get total" do
    order.add_item(:fresh_brains, 15,1)
    order.add_item(:stale_brains, 15,1)
    expect(order.order_total).to eq(30)
  end

  it "allows for quantities of more than 1" do 
    order.add_item(:fresh_brains, 15, 2)
    expect(order.order_total).to eq(30)
  end

  it "calculates total correctly with multiple line_items and quantities" do 
    order.add_item(:fresh_brains, 15, 2)
    order.add_item(:stale_brains, 10, 1)
    order.add_item(:vintage_blood_and_gore, 50, 1)
    expect(order.order_total).to eq(90)
  end

  it "gives an error when customers can't do math" do
    order.add_item(:fresh_brains, 15, 2)  
    expect( lambda {order.place_order(15, '+441234567890')} ).to raise_error(RuntimeError)
  end 
context "***test fails unless the correctly registered twilio number is provided***" do
  it "sends a message to the customer when order is successfully placed" do
    order.add_item(:fresh_brains, 15, 2)
    order.place_order(30, '+441234567890')
    expect(Twilio::REST::Client).to receive(:new).and_return(twilio_client)
    expect(simplemessage.twilio_app).to eq twilio_client
  end
end

end