class DiaryEntry
  def initialize(title,contents)
    @title = title
    @contents = contents
    @words_read = 0
  end

  def title
    return @title
  end

  def content
    return @contents
  end

  def count_words
    return words.length
  end

  def reading_time(wpm)
    fail "Reading speed must be above zero" unless wpm > 0
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    fail "Reading speed must be above zero" unless wpm > 0
    words_readable = wpm * minutes
    start_at = @words_read
    end_at = @words_read + words_readable

    if start_at >= count_words
      start_at = 0
      end_at = words_readable
    end

    chunk_words = words[start_at,end_at].join(" ")
    @words_read += words_readable
    return chunk_words
  end

  private

  def words
    @contents.split(" ")
  end
end