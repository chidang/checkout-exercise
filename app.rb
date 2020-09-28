require_relative 'lib/item'
require_relative 'lib/checkout'
require_relative 'lib/promotion'

item_a = Item.new('A', 30)
item_b = Item.new('B', 20)
item_c = Item.new('C', 50)
item_d = Item.new('D', 15)

rule_1 = Promotion.new('A', 3, 75)
rule_2 = Promotion.new('B', 2, 35)
rules = [rule_1, rule_2]

co_1 = Checkout.new(rules)
co_1.scan(item_a)
co_1.scan(item_b)
co_1.scan(item_c)

co_2 = Checkout.new(rules)
co_2.scan(item_b)
co_2.scan(item_a)
co_2.scan(item_b)
co_2.scan(item_a)
co_2.scan(item_a)

co_3 = Checkout.new(rules)
co_3.scan(item_c)
co_3.scan(item_b)
co_3.scan(item_a)
co_3.scan(item_a)
co_3.scan(item_d)
co_3.scan(item_a)
co_3.scan(item_b)

co_4 = Checkout.new(rules)
co_4.scan(item_c)
co_4.scan(item_a)
co_4.scan(item_d)
co_4.scan(item_a)
co_4.scan(item_a)

puts "\n===================OUTPUT 1==================="
puts co_1.total

puts "\n===================OUTPUT 2==================="
puts co_2.total

puts "\n===================OUTPUT 3==================="
puts co_3.total

puts "\n===================OUTPUT 4==================="
puts co_4.total

