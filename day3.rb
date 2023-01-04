require 'byebug'

class RucksackReader
  def initialize(input)
    @input = input
    @score = 0
  end

  def prioritization_score
    create_chart
    input_array = @input.split("\n")
    grouped = input_array.each_slice(3) do |x, y, z|
      common =  x.chars & y.chars & z.chars
      @score += @chart[common.first]
    end
    # part1
    p @score
  end

  def part1
    @input.split("\n").each do |string|
      string
      left = string.chars[0..(string.length/2 - 1)]
      right = string.chars[(string.length/2..string.length)]
      p common = (left & right).first
      p @chart[common]
      @score += @chart[common]
    end
  end

  def create_chart
    @chart = {}
    'a'.upto('z').each_with_index do |letter, index|
      @chart[letter] = index + 1
    end

    'A'.upto('Z').each_with_index do |letter, index|
      @chart[letter] = index + 27
    end
    @chart
  end
end

rr = RucksackReader.new(File.read('day3input.txt'))
rr.prioritization_score