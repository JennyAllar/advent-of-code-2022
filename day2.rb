require 'byebug'

class RockPaperScissors
  def initialize(input)
    @score = 0
    @input_array = input.split("\n")
  end

  def total_score
    @input_array.each do |round|
      round = Round.new(round)
      @score += round.points
    end
    p @score
  end

  class Round
    def initialize(hand)
      @round_score = 0
      @opponent_throw = hand.split(" ")[0]
      @outcome = hand.split(" ")[1]
    end

    def points
      byebug
      if @outcome == 'X'
        loss
      elsif @outcome == 'Y'
        draw
      elsif @outcome == 'Z'
        win
      end
      p @round_score
    end

    def rock
      @round_score += 1
    end

    def paper
      @round_score += 2
    end

    def scissors
      @round_score += 3
    end

    def loss
      @round_score += 0
      if @opponent_throw == 'A'
        scissors
      elsif @opponent_throw == 'B'
        rock
      elsif @opponent_throw == 'C'
        paper
      end
    end

    def win
      @round_score += 6
      if @opponent_throw == 'A'
        paper
      elsif @opponent_throw == 'B'
        scissors
      elsif @opponent_throw == 'C'
        rock
      end
    end

    def draw
      @round_score += 3
      if @opponent_throw == 'A'
        rock
      elsif @opponent_throw == 'B'
        paper
      elsif @opponent_throw == 'C'
        scissors
      end
    end

    def round_score
      @round_score
    end
  end
end

input = File.read('day2input.txt')
rps = RockPaperScissors.new(input)
rps.total_score