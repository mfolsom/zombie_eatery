class Takeaway
	attr_reader :menu
	
	def initialize
		@menu = {}
	end
  def create_menu_item(name, price)
    name = Dish.new(name,price).name
    price = Dish.new(name,price).price
    @menu[name] = price
  end
end