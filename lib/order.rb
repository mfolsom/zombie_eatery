require_relative "message"

class Order
	
  def initialize
    @line_item = {}
  end

  def add_item(dish, price, qty)
    item_total = qty * price
    @line_item[dish]= item_total
  end

  def line_item
    @line_item
  end

  def place_order(mytotal)
  	mytotal != order_total ? raise("Total is not correct!") : SimpleMessage.new('+447817212078').simple_message 
  end

  def order_total
    @line_item.values.inject{|sum, num| sum + num}
  end
end