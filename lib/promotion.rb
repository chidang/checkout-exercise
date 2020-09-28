class Promotion

  attr_accessor :item_code, :min_quantity, :price

  def initialize(item_code, min_quantity, price)
   @item_code = item_code
   @min_quantity = min_quantity
   @price = price
  end

  # For example:
  # If 3 of Item A purchased, the price for all 3 is £75
  # If 2 of Item B purchased, the price for both is £35
end
