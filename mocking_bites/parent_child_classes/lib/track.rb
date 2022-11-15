class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    return true if @title.include?(keyword)
    return true if @artist.include?(keyword)
    return false
  end
end