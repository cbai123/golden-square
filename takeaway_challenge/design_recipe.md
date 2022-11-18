# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to _see a list of dishes with prices._

As a customer
So that I can order the meal I want
I would like to be able to _select some number of several available dishes._

As a customer
So that I can verify that my order is correct
I would like to _see an itemised receipt with a grand total._

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
_I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered._

Fair warning: if you push your Twilio API Key to a public Github repository, anyone will be able to see and use it. What are the security
implications of that? How will you keep that information out of your repository?

## 2. Design the Class System

list menu items + prices
select multiple menu items
print receipt with grand total
send text to phone number

Menu class
contains list of menu items
print list
takes selection
prints receipt
texts

MenuItem class
contains name and price


_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌──────────────────────┐
│  Order               │
│  ----                │
│                      │
│  menu                │
│  select              │
│  receipt             │
│  order               │
│                      │
└──────────┬───────────┘
           │
           │
           │
           │
           │
┌──────────▼───────────┐
│ MenuItem             │
│ --------             │
│                      │
│ name                 │
│ price                │
│                      │
└──────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Order
  # def initialize
  #   # menu = {...}
      # @io = io
  # end

  def menu
    # prints menu items with prices
    # returns nothing
  end

  def select(item) # item is a string
    # adds selection to array
    # returns nothing
  end

  def receipt
    # prints selected items with grand total price
  end

  def confirm
    # puts what is your number?
    # gets phone number
    # confirm order
    # texts confirmation
  end
end

# class MenuItem
#   def initialize(name, price)
#     # ...
#   end

#   def name
#     # returns name
#   end

#   def price
#     # returns price
#   end
# end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
item_1 = MenuItem.new("Cod", 3.50)
item_2 = MenuItem.new("Sausage", 3.50)
item_3 = MenuItem.new("Halloumi", 3.00)
item_4 = MenuItem.new("Chips", 2.00)
item_5 = MenuItem.new("Large Chips", 3.00)
item_6 = MenuItem.new("Peas", 1.50)

order = Order.new

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# 1
io = double :io
order = Order.new(io)
io.menu # => puts menu

# 2
io = double :io
order = Order.new
io.menu
io.select("Cod")
io.select("Chips")
io.select("Peas")
io.receipt # => puts cod, chips, peas £7.00

# 3
io = double :io
order = Order.new
io.menu
io.select("Cod")
io.select("Chips")
io.select("Peas")
io.confirm # => puts what is your number?; gets phone number

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._