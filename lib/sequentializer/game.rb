require 'pry'

module Sequentializer
  class Game

    def initialize(output)
      @output = output
    end

    def start(solution)
      @solution = solution.split("")
      @output.puts("Get ready to sequentialize!")
      @output.puts("Enter guess: ")
    end

    def guess(guess)
      @guess = guess

      if @guess == "show"
        @output.puts(@solution.join(""))
        return
      end

      marker = Marker.new(@solution)
      @output.puts(marker.evaluate(@guess))

      check_for_win
    end

    private

    def check_for_win
      if @guess == @solution.join("")
        @output.puts("You are wicked smart")
      end
    end

  end
end
