module Sequentializer
  class Marker
    def initialize(solution)
      @solution = solution
    end

    def evaluate(guess)
      @guess = guess.split("")
      exact_matches = []
      value_matches = []

      @guess.each_with_index do |guess_val, guess_index|
        if is_exact_match?(guess_val, guess_index)
          exact_matches << "+"
        elsif is_value_match?(guess_val)
          value_matches << "-"
        end
      end

      exact_matches.join << value_matches.join
    end

    def is_value_match?(guess_value)
      @solution.include?(guess_value)
    end

    def is_exact_match?(guess_value, guess_index)
      @solution[guess_index] == guess_value
    end

  end
end
