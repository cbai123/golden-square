class MusicTracker
  def initialize
    @list = []
  end

  def add(track)
    @list << track unless @list.include?(track)
  end
  
  def list
    return @list
  end
end