require 'spec_helper'

module Sequentializer
  describe Game do

    describe "#start" do
      let(:output) { double(:output).as_null_object }
      let(:game) { Game.new(output) }
      let(:solution) { double(:solution).as_null_object }

      it "sends a welcome message" do
        output.should_receive(:puts).with("Get ready to sequentialize!")
        game.start(solution)
      end
    end

    describe "#guess" do
      let(:output) { double(:output).as_null_object }
      let(:game) { Game.new(output) }
      let(:solution) { "1234" }
      let(:marker) { double(:marker).as_null_object }

      before do
        game.start(solution)
      end

      context "when the guess is incorrect" do
        let(:guess) { "9285" }

        it "marks the correctness of the users guess" do
          Marker.should_receive(:new).with(solution.split("")).and_return(marker)
          marker.should_receive(:evaluate).with(guess)
          game.guess(guess)
        end
      end

      context "when there are 4 exact matches" do
        it "shows the win message" do
          output.should_receive(:puts).with("++++")
          output.should_receive(:puts).with("You are wicked smart")
          game.guess("1234")
        end
      end

      context "when the user inputs 'show'" do 
        it "shows the solution" do
          output.should_receive(:puts).with(solution);
          game.guess("show")
        end
      end
    end

  end
end
