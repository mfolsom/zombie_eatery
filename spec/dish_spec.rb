require 'spec_helper'

describe Dish do
	
  it "has a name" do
    expect(Dish.new(:brains, 12).name).to eq(:brains)
	end

	it "has a price" do
		expect(Dish.new(:brains, 12).price).to eq(12)
	end

end