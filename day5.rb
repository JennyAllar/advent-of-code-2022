require 'byebug'

class CrateManager
  def initialize(input)
    @input = input
    @matrix = @input.split("\n\n")[0]
    @stack_names = stack_names
    @commands = @input.split("\n\n")[1]
    @container = []
    @containers = @input.split("\n\n")[0]
  end

  # 1 split input into:
  #     boxes, stack_names, commands
  # 2 create array of stack objects
  # 3 iterate over boxes
  #     put them in stacks based on index number
  # 4 go through moves to move crates
  # 4 get last value of each stack (top)
  #

  def create_stacks
    # @dictionary = stack_names.map{|e|[e,[]]}.to_h
    @stack_names.each do |name|
      @container << Stack.new(name, [])
    end
  end

  def stack_names
    values = @matrix.split("\n").pop
    values.chars.reject{|c| c == " "}
  end

  def add_contents
    @matrix.split("\n")[0..-2].reverse.each do |row|
      chunks = row.chars.each_slice(4)
      chunk_index = 0
      chunks.each do |chunk|
        c = Chunk.new(chunk)
        unless c.empty?
          stack = @container[chunk_index]
          stack.contents << c.char
        end
        chunk_index += 1
      end
    end
  end

  def move_crates
    @commands.split("\n").each do |command|
      c = Command.new(command)
      stack_index_from = c.moving_from - 1
      stack_index_to = c.moving_to - 1
      crates_to_move = @container[stack_index_from].contents.pop(c.number_of_crates)
      crates_to_move.each do |crate|
        @container[stack_index_to].contents << crate
      end
    end
  end

  def top_of_stacks
    create_stacks
    add_contents
    move_crates

    tops = []
    @container.each do |container|
      tops << container.contents.last
    end
    tops.join""
  end

  class Stack
    def initialize(name, contents)
      @name = name
      @contents = contents
    end

    def contents
      @contents
    end

    def top_of_stack
      @contents.last
    end
  end

  class Row
    def initialize(boxes)
      @boxes = boxes
    end
  end

  class Command
    def initialize(sentence)
      @sentence = sentence
    end

    def number_of_crates
      @sentence.split(" ")[1].to_i
    end

    def moving_from
      @sentence.split(" ")[3].to_i
    end

    def moving_to
      @sentence.split(" ")[5].to_i
    end
  end

  class Chunk
    def initialize(chars)
      @chars = chars
    end

    def empty?
      @chars.uniq == [" "]
    end

    def char
      @chars[1]
    end
  end
end

cs = CrateManager.new(File.read('day5input.txt'))
p cs.top_of_stacks