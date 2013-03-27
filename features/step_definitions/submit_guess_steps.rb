Given /^the solution is "(.*?)"$/ do |solution|
  start_game(solution)
end

When /^I guess "(.*?)"$/ do |guess|
  @game.guess(guess)
end

Then /^the mark should be "(.*?)"$/ do |mark|
  output.messages.should include(mark)
end
