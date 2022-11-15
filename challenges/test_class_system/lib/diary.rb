class Diary
  def initialize
    @list = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @list << entry
  end

  def all
    return @list
  end

  def count_words
    word_count = 0
    for i in 0...@list.length
      word_count += @list[i].count_words
    end
    return word_count
  end

  def reading_time(wpm) 
    return (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    readable = @list.select { |entry| entry.reading_time(wpm) <= minutes}
    fail "No readable entries" if readable.empty?
    readable.max_by(&:count_words)
  end
end