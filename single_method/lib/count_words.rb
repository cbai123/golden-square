def count_words(str)
  arr = str.split
  words = []
  arr.each { |item| if item.match?(/[[:alnum:]]/) then words.push(item) end}
  words.length
end