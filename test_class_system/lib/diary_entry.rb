class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @words_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return words.length
  end

  def reading_time(wpm)
    return count_words / wpm
  end

  def reading_chunk(wpm, minutes)
    words_readable = wpm * minutes
    start_at = @words_read
    end_at = @words_read + words_readable

    if start_at >= count_words
      start_at = 0
      end_at = words_readable
    end

    chunk =  words[start_at,end_at].join(" ")
    @words_read += words_readable
    return chunk

    
    # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end

  def words
    return @contents.split
  end
end