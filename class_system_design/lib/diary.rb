class Diary
  def initialize
    @diary_list = []
    @task_list = []
    @numbers = []
  end
  def add_diary(entry) # entry is an instance of DiaryEntry class
    @diary_list << entry
  end

  def add_task(todo) # todo is an instance of Todo class
    @task_list << todo
  end

  def list_todo
    @task_list
  end

  def list_diary
    @diary_list
  end

  def find_best_diary_entry(wpm, minutes)
    fail "wpm must be > 0" unless wpm > 0
    readable_entries = @diary_list.select { |entry|
      entry.reading_time(wpm) <= minutes
    }
    return readable_entries.max_by { |entry|
      entry.count_words 
    }
  end

  def list_numbers
    @diary_list.each { |entry|
      entry.phone_numbers.each{ |number|
        @numbers << number
      }
    }
    return @numbers
  end
end