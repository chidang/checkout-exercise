class Checkout

  def initialize(rules)
    @items = []
    @rules = rules
    @total = 0
  end

  # Add an item to the basket, incrementing its quantity if already present
  def scan(item)
    found_item = find_by_code(item.code)
    if found_item
      found_item[:quantity] += 1
    else
      @items << { data: item, quantity: 1 }
    end
  end
  
  private

  # Find an item in the basket by its product code
  def find_by_code(code)
    @items.detect { |item| item[:data].code == code }
  end
end
