# frozen_string_literal: true

require 'byebug'

class PacketParser
  # 1. split input into chars
  # 2. iterate over chars
  #     a. look 1, 2, & 3 spots ahead to see if characters match
  def initialize(input)
    @input = input
  end

  def packet_marker
    marker = 0
    @input.split('').each_with_index do |_letter, index|
      letters = []
      14.times do |time|
        letters << @input[index + time]
      end
      if letters.uniq.count == 14
        marker = index + 14
        break
      end
    end
    marker
  end
end

pp = PacketParser.new(File.read('day6input.txt'))
p pp.packet_marker
