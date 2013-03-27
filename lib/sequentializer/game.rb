module Sequentializer
  class Game

    def initialize(output)
      @output = output
    end

    def start
      @output.puts("Get ready to sequentialize!")
      @output.puts("Enter guess: ")
    end

  end
end
