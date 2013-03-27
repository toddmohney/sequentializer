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

      it "prompts the user for input" do
        output.should_receive(:puts).with("Enter guess: ")
        game.start(solution)
      end
    end

    describe "#guess" do
      let(:output) { double(:output).as_null_object }
      let(:game) { Game.new(output) }
      let(:solution) { "1234" }

      before do
        game.start(solution)
      end

      context "with no matches" do
        it "returns an empty mark pattern" do
          output.should_receive(:puts).with("")
          game.guess("9999")
        end
      end

      context "with 1 match" do
        context "in the incorrect location" do
          it "outputs a pattern of -" do
            output.should_receive(:puts).with("-")
            game.guess("9991")
          end
        end
        
        context "in the correct location" do
          it "outputs a pattern of +" do
            output.should_receive(:puts).with("+")
            game.guess("1999")
          end
        end
      end

      context "with 2 matches" do
        context "both in the incorrect location" do
          it "outputs a pattern of --" do
            output.should_receive(:puts).with("--")
            game.guess("9921")
          end
        end
        
        context "both in the correct location" do
          it "outputs a pattern of ++" do
            output.should_receive(:puts).with("++")
            game.guess("1299")
          end
        end

        context "one in the correct postion and one in the incorrect position" do
          it "outputs a pattern of +-" do
            output.should_receive(:puts).with("+-")
            game.guess("1992")
          end
        end
      end

      context "with 3 matches" do
        context "with all in the correct locations" do
          it "outputs a pattern of +++" do
            output.should_receive(:puts).with("+++")
            game.guess("1239")
          end
        end

        context "with all in the incorrect locations" do
          it "outputs a pattern of ---" do
            output.should_receive(:puts).with("---")
            game.guess("2193")
          end
        end
        
        context "with 2 in the correct locations" do
          it "outputs a pattern of ++-" do
            output.should_receive(:puts).with("++-")
            game.guess("1293")
          end
        end
        
        context "with 1 in the correct location" do
          it "outputs a pattern of +--" do
            output.should_receive(:puts).with("+--")
            game.guess("1329")
          end
        end
      end

      context "with 4 matches" do
        context "with all in the correct locations" do
          it "outputs a pattern of ++++" do
            output.should_receive(:puts).with("++++")
            game.guess("1234")
          end
        end

        context "with all in the incorrect locations" do
          it "outputs a pattern of ----" do
            output.should_receive(:puts).with("----")
            game.guess("4321")
          end
        end
        
        context "with 2 in the correct locations" do
          it "outputs a pattern of ++--" do
            output.should_receive(:puts).with("++--")
            game.guess("1324")
          end
        end
        
        context "with 1 in the correct location" do
          it "outputs a pattern of +--" do
            output.should_receive(:puts).with("+---")
            game.guess("1423")
          end
        end
      end
    end

  end
end
