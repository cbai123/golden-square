# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
verify = grammar(text)

text: a string (e.g. Hello, my name is.)
verify = a boolean
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
grammar("Hello.") => true
grammar("hello") => false
grammar("hello, my name is Chris.") => false
grammar("Hello, my name is Chris!") => true
grammar("What's yours?") => true
grammar("Hello") => false
```
## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._