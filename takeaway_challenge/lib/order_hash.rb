# class Order
#   def initialize(io)
#     @io = io
#     @menu = {
#       :Cod => 3.5,
#       :Sausage => 3.5,
#       :Halloumi => 3.0,
#       :Chips => 2.0,
#       :Peas => 1.5
#     }
#     @ordered = {}
#   end

#   def menu
#     @io.puts "Menu:"
#     @menu.each{ |item, price|
#       @io.puts "#{item} - £#{price}0"
#     }
#   end

#   def select(item)
#     @ordered[item.to_sym] = @menu[item.to_sym]
#   end

#   def receipt
#     sum = 0
#     @io.puts "Receipt:"
#     @ordered.each{ |item, price|
#       @io.puts "#{item} - £#{price}0"
#       sum += price
#     }
#     @io.puts "Total - £#{sum}0"
#   end
# end