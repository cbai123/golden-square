## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class TaskTracker
  def initialize
    #...
  end

  def add(task) # task is a string
    # adds task to list
    # No return value
  end

  def list
    # returns list of stored task
  end

  def complete(task)
    # removes task from list
    # fails if the task doesnt exist
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
task_list = TaskTracker.new
task_list.list # => []

task_list = TaskTracker.new
task_list.add("brush teeth")
task_list.list # => ["brush teeth"]

task_list = TaskTracker.new
task_list.add("brush teeth")
task_list.add("shower")
task_list.list # => ["brush teeth", "shower"]

task_list = TaskTracker.new
task_list.add("")
task_list.list # => []

task_list = TaskTracker.new
task_list.add("brush teeth")
task_list.add("shower")
task_list.complete("brush teeth")
task_list.list # => ["shower"]

task_list = TaskTracker.new
task_list.add("shower")
task_list.complete("brush teeth") # fails
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
