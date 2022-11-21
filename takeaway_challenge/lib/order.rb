require 'twilio-ruby'

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

  def confirm(phone_number)
    @io.puts "Please enter your number:"
    @io.gets.chomp

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      body: 'Thank you! Your order was placed and will be delivered before 18:52',
      from: '+19704382266',
      to: phone_number
    )
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