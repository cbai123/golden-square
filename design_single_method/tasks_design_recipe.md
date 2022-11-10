# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
verify = task_tracker(text)

text: a string (e.g. "#TODO make breakfast")
verify: a boolean
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
task_tracker("") => false
task_tracker("#TODO make breakfast") => true
task_tracker("TODO brush teeth") => false
task_tracker("# eat lunch") => false
task_tracker("#TODO shower") => true
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
