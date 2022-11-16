class TaskFormatter
  def initialize(task)
    @task = task # task is an instance of Task
  end

  def format
    return "- [#{@task.complete? ? 'x' : ' '}] #{@task.title}"
  end
end