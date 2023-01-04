require 'byebug'
class CleanUp
  def initialize(input)
    @input = input
    @total = 0
  end

  def num_of_pairs_duplicated
    @input.split("\n").each do |pair|
      p top = pair.split(",")[0]
      p bottom = pair.split(",")[1]
      top_start = top.split("-")[0].to_i
      top_end = top.split("-")[1].to_i
      bottom_start = bottom.split("-")[0].to_i
      bottom_end = bottom.split("-")[1].to_i
      if top_start <= bottom_start && top_end >= bottom_end
        @total += 1
      end

      if bottom_start <= top_start && bottom_end >= top_end
        @total += 1
      end
    end
    p @total
  end

  def duped_pairs
    count = 0
    @input.split("\n").each do |pair|
      top = Pair.new(pair.split(",")[0])
      bottom = Pair.new(pair.split(",")[1])
      #3-7,4-8
      # if top.start <= bottom.start && top.end >= bottom.end
      #   count += 1
      # elsif bottom.start <= top.start && bottom.end >= top.end
      #   count += 1
      # else
      #   next
      # end
      count += 1 if common_number?(top, bottom)
    end
    count
  end

  def common_number?(top, bottom)
    (top.full_set & bottom.full_set) != []
  end

  def find_range(coordinates)
    coor_array = coordinates.split("-")
    start = coor_array[0].to_i
    end_p = coor_array[1].to_i
    (start..end_p).to_a.join(",")
  end

  class Pair
    def initialize(pair)
      @start = pair.split("-")[0].to_i
      @end = pair.split("-")[1].to_i
    end

    def start
      @start
    end

    def end
      @end
    end

    def range
      @end - @start
    end

    def full_set
      (@start..@end).to_a
    end
  end
end

c = CleanUp.new(File.read('day4input.txt'))
p c.duped_pairs