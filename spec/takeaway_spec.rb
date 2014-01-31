require 'spec_helper'

describe Takeaway do
	let(:takeaway) {Takeaway.new}

  it "should have a menu" do
  	takeaway.create_menu_item(:fresh_brains, 15)
  	takeaway.create_menu_item(:stale_brains, 10)
  	takeaway.create_menu_item(:vintage_blood_and_gore, 50)
    expect(takeaway.menu).to eq({:fresh_brains => 15,
                                :stale_brains => 10,
                                :vintage_blood_and_gore => 50})
  end
end