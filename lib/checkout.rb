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

  def total
    @items.each do |basket_item|
      rule = find_rule_by_code(basket_item[:data].code)
      if rule
        @total += (basket_item[:quantity] / rule.min_quantity) * rule.price
        @total += (basket_item[:quantity] % rule.min_quantity) * basket_item[:data].price
      else
        @total += basket_item[:data].price
      end
    end

    discounted_total(@total)
  end

  private

  # Find an item in the basket by its product code
  def find_by_code(code)
    @items.detect { |item| item[:data].code == code }
  end

  # Find an rule by its product code
  def find_rule_by_code(code)
    @rules.detect { |rule| rule.item_code == code }
  end

  # If total basket price (after previous discounts) is over £150, the basket receivers a discount of £20
  def discounted_total(total)
    if total >= 150
      total = total - 20
    else
      total
    end
  end
end
