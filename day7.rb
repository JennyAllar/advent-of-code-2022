require 'byebug'

class Terminal
  def initialize(input)
    @input = input
    @commands = @input.split("\n")
    @hash = {'/': nil}
  end

  def total_size
    create_tree
  end

  def create_tree
    @commands.each do |command|
      if command.split(" ")[0] == 'dir'
        @hash[command.split(" ")[1]] = nil
      end
    end
    @hash.keys.each do |key|
      if key == :/
        start = @commands.find_index("$ cd #{key.to_s}")
        total = 0
        @commands[(start+ 2)..].each do |c|
          break if c.split(" ")[0] == "$"
          unless c.split(" ")[0] == 'dir'
            total += c.split(" ")[0].to_i
          end
          byebug
        end
        @hash[key] = total
      end
    end
    @hash
  end

  class Command
    def initialize(command)
      @
    end
  end
end

t = Terminal.new(File.read('day7input.txt'))
p t.total_size