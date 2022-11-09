def reading_time(text)
  words = text.split
  time = words.length / 200.0
  return time.round
end