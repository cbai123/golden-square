class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @numbers = []
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split.length
  end

  def reading_time(wpm)
    fail "wpm must be > 0" unless wpm > 0
    (count_words / wpm.to_f).ceil
  end

  def phone_numbers
    @contents.scan(/[0-9]{11}/).each { |number|
    @numbers << number
    }
    return @numbers.uniq!
  end
end