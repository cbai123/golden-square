# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_


keep a diary
add entries
read past entries
select entries based on time and reading speed
calculate reading time for entry
count words in entry
keep a todo list
list of phone numbers

```
                    ┌─────────────────────────────────┐
                    │                                 │
                    │   Diary                         │
                    │   -----                         │
                    │                                 │
                    │   - add(entry)                  │
          ┌─────────┤   - add(todo)                   ├──────────┐
          │         │   - list_diary                  │          │
          │         │   - find_best_diary_entry       │          │
          │         │   - list_todo                   │          │
          │         │   - list_numbers                │          │
          │         └─────────────────────────────────┘          │
          │                                                      │
          │                                                      │
          │                                                      │
┌─────────▼────────────────────┐            ┌────────────────────▼────────────┐
│                              │            │                                 │
│  DiaryEntry                  │            │   Todo                          │
│  ----------                  │            │   ----                          │
│                              │            │                                 │
│  - initialize(title,contents)│            │   - initialize(title)           │
│  - title                     │            │   - title                       │
│  - contents                  │            │                                 │
│  - count_words               │            └─────────────────────────────────┘
│  - reading_time              │
│                              │
└──────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def add_diary(entry) # entry is an instance of DiaryEntry class
    # returns nothing
  end

  def add_task(todo) # todo is an instance of Todo class
    # returns nothing
  end

  def list_diary
    # returns list of diary entries
  end

  def find_best_diary_entry(wpm, minutes) # wpm and minutes are integers, 
                                          # wpm is user reading speed, minutes is how long user has to read
    # returns longest diary entry that can be read in minutes
  end

  def list_todo
    # returns the list of todo tasks
  end

  def list_numbers
    # returns a list of phone numbers in diary entries
  end
end

class DiaryEntry
  def initialize(title, contents)
    # ...
  end

  def title
    # returns the entry title
  end

  def contents
    # returns entry contents
  end

  def count_words
    # returns the number of words in the entry contents
  end

  def reading_time(wpm)
    # returns the time to read the entry contents
  end
end

class Todo
  def initialize(title)
    # ...
  end

  def title
    # returns the title
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# 1
diary = Diary.new
entry_1 = DiaryEntry.new("my title", "my contents")
entry_2 = DiaryEntry.new("my title 2", "my contents 2")
diary.add_diary(entry_1)
diary.add_diary(entry_2)
diary.list_diary # => [entry_1, entry_2]

# 2
diary = Diary.new
entry_1 = DiaryEntry.new("title", "one two three four")
entry_2 = DiaryEntry.new("title 2", "five six seven eight nine ten")
entry_3 = DiaryEntry.new("title 3", "eleven twelve")
diary.add_diary(entry_1)
diary.add_diary(entry_2)
diary.add_diary(entry_3)
diary.find_best_diary_entry(5,1) # => entry_1

# 3
diary = Diary.new
entry_1 = DiaryEntry.new("title", "one two three four")
entry_2 = DiaryEntry.new("title 2", "five six seven eight nine ten")
entry_3 = DiaryEntry.new("title 3", "eleven twelve")
diary.add_diary(entry_1)
diary.add_diary(entry_2)
diary.add_diary(entry_3)
diary.find_best_diary_entry(0,1) # => fail: wpm must be > 0

# 4
diary = Diary.new
todo_1 = Todo.new("brush teeth")
todo_2 = Todo.new("walk the dog")
diary.add_task(todo_1)
diary.add_task(todo_2)
diary.list_todo # => [todo_1, todo_2]

# 5
diary = Diary.new
entry_1 = DiaryEntry.new("title", "07812345678")
entry_2 = DiaryEntry.new("title 2", "my friend's number is 07987654321.")
diary.add_diary(entry_1)
diary.add_diary(entry_2)
diary.list_numbers # => ["07812345678", "07987654321"]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Diary

# 1
diary = Diary.new
diary.list_diary # => []

# 2
diary = Diary.new
diary.list_todo # => []

# 3
diary = Diary.new
diary.list_numbers # => []


# DiaryEntry

# 1
entry = DiaryEntry.new("my title", "my contents")
entry.title # => "my title"

# 2
entry = DiaryEntry.new("my title", "my contents")
entry.contents # => "my contents"

# 3
entry = DiaryEntry.new("title", "one two three four")
entry.count_words # => 4

# 4
entry = DiaryEntry.new("title", "")
entry.count_words # => 0

# 5
entry = DiaryEntry.new("title", "one two three four five")
entry.reading_time(2) # => 3

# 6
entry = DiaryEntry.new("title", "one two three four five")
entry.reading_time(0) # => fail: wpm must be > 0


# Todo

# 1
task = Todo.new("walk the dog")
task.title # => "walk the dog"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
