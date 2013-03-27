def start_game(solution)
  @game = Sequentializer::Game.new(output)
  @game.start(solution)
end
