def make_snippet(str)
  arr = str.split
  if arr.length <= 5
    return str
  else
    return arr[0..4].join(" ") + "..."
  end
end