require 'spec_helper'

module Sequentializer
  describe Game do

    describe "#start" do
      let(:output) { double(:output).as_null_object }
      let(:game) { Game.new(output) }

      it "sends a welcome message" do
        output.should_receive(:puts).with("Get ready to sequentialize!")
        game.start
      end

      it "prompts the user for input" do
        output.should_receive(:puts).with("Enter guess: ")
        game.start
      end
    end

  end
end
