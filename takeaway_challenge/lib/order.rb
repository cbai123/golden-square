class Order
  def initialize(io)
    @io = io
    @menu = []
    @ordered = []
  end

  def add(item)
    @menu << item
  end 

  def menu
    @io.puts "Menu:"
    @menu.each{ |item| 
      @io.puts "#{item.name} - £#{item.price}0"
    } 
  end

  def select(item)
    @menu.each{ |menu_item|
      if menu_item.name == item
        @ordered << menu_item
      end
    }
  end

  def receipt
    @io.puts "Receipt:"
    @ordered.each { |item| 
      @io.puts "#{item.name} - £#{item.price}0"
    }
    receipt_total
  end

  private

  def receipt_total
    sum = 0
    @ordered.each { |item|
      sum += item.price
    }
    @io.puts "Total - £#{sum}0"
  end
end