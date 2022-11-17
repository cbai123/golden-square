class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will subtract two numbers."
    number_1 = get_nums
    @io.puts "Please enter another number"
    number_2 = get_nums
    @io.puts "Here is your result:"
    @io.puts format_number(number_1, number_2)
  end

  private

  def get_nums
    num = @io.gets.chomp
    return num.to_i if num.to_i.to_s == num
    fail "You must enter a number"
  end

  def format_number(number_1, number_2)
    result = number_1 - number_2
    return "#{number_1} - #{number_2} = #{result}"
  end
end










# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run

# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1