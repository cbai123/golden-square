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
    time = 0
    for i in 0...@list.length
      time += @list[i].reading_time(wpm)
    end
    return time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    words_readable = wpm * minutes

    reading_times = []
    for i in 0...@list.length
      reading_times << @list[i].reading_time(wpm)
    end

    index = reading_times.find_index(reading_times.min_by { |time| (minutes - time).abs })

    return "#{@list[index].title}: #{@list[index].contents}"
  end
end