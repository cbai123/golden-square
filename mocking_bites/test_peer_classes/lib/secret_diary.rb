
class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
    @locked = true
  end

  def read
    fail "Go away!" if @locked
    @diary.read
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end