class GrammarStats

  def initialize
    @success = 0
    @fail = 0
  end

  def check(text)
    punctuation = [".","!","?"]
    if text[0] == text[0].upcase && punctuation.include?(text[-1])
      @success += 1
      return true
    else
      @fail += 1
      return false
    end
  end

  def percentage_good
    return @success * 100 / (@success + @fail)
  end
end