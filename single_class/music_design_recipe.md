## 1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class MusicTracker
  def initialize
    #...
  end

  def add(track) # track is a string
    # adds track to list
    # no return value
  end

  def list
    # returns list of tracks
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby

# 1
playlist = MusicTracker.new
playlist.list # => []

# 2
playlist = MusicTracker.new
playlist.add("Can't Stop")
playlist.list # => ["Can't Stop"]

# 3
playlist = MusicTracker.new
playlist.add("Can't Stop")
playlist.add("Dani California")
playlist.list # => ["Can't Stop", "Dani California"]

# 4
playlist = MusicTracker.new
playlist.add("Can't Stop")
playlist.add("Can't Stop")
playlist.list # => ["Can't Stop"]
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
