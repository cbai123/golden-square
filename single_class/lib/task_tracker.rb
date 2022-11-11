class TaskTracker
  def initialize
    @list = []
  end

  def add(task)
    if !task.empty? then @list << task end
  end

  def complete(task)
    fail "Task does not exist" unless @list.include?(task)
    @list.delete(task)
  end

  def list
    return @list
  end
end