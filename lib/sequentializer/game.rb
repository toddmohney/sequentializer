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
      guess = guess.split("")
      response = evaluate(guess, @solution)
      @output.puts(response)
    end

    private 

    def evaluate(guess, solution)
      exact_matches = []
      value_matches = []

      guess.each_with_index do |guess_val, guess_index|
        if is_exact_match?(guess_val, guess_index)
          exact_matches << "+"
        elsif is_value_match?(guess_val)
          value_matches << "-"
        end
      end

      exact_matches.join << value_matches.join
    end

    def is_value_match?(guess_val)
      @solution.include?(guess_val)
    end

    def is_exact_match?(guess_value, guess_index)
      @solution[guess_index] == guess_value
    end
  end
end
