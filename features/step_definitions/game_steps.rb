Given /^I am not yet playing$/ do

end

When /^I start a new game$/ do
  game = Sequentializer::Game.new(output)
  game.start("1234")
end

Then /^I should see the message "(.*?)"$/ do |message|
  output.messages.should include(message)
end

Then /^I should see the prompt "(.*?)"$/ do |prompt|
  output.messages.should include(prompt)
end


require 'pry'

class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end
