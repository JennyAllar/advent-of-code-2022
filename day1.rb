class CalorieCounter
  def initialize(input)
    @food_array = input.split("\n\n")
  end

  def calculate_subtotal
    @subtotaled_array = []
    @food_array.each do |food_held|
      total = 0
      food_held.split("\n").each do |quantity|
        total += quantity.to_i
      end
      @subtotaled_array << total
    end
  end

  def find_highest_total_calories
    calculate_subtotal
    total = 0
    @subtotaled_array.sort.last(3).each do |sub|
      total += sub
    end

    p total
  end
end

input = File.read('day1input.txt')
cc = CalorieCounter.new(input)
# cc.calculate_subtotal
cc.find_highest_total_calories
