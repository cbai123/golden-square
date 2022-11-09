def grammar(text)
  punctuation = [".","!","?"]
  if text[0] == text[0].upcase && punctuation.include?(text[-1])
    true
  else
    false
  end
end