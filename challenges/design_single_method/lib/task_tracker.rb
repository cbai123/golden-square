def task_tracker(text)
  if text.include?("#TODO")
    true
  else
    false
  end
end