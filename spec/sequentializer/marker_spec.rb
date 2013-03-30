require 'spec_helper'

module Sequentializer

  describe Marker do
    let(:marker) { Marker.new("1234") }

    describe "#is_value_match"do
      context "when the value exists in the solution" do
        let(:guess) { "3" }

        it "return true" do
          marker.is_value_match?(guess).should == true
        end
      end

      context "when the value does not exist in the solution" do
        let(:guess) { "8" }

        it "return false" do
          marker.is_value_match?(guess).should == false
        end
      end
    end

    describe "#is_exact_match" do
      context "when the guess does not exist in the solution" do
        let(:guess) { "9" }
        let(:index) { 1 }

        it "returns false" do
          marker.is_exact_match?(guess, index).should == false
        end
      end

      context "when the guess exists at the specified index" do
        let(:guess) { "2" }
        let(:index) { 1 }

        it "returns true" do
          marker.is_exact_match?(guess, index).should == true
        end
      end

      context "when the guess does not exist at the index" do
        let(:guess) { "2" }
        let(:index) { 3 }

        it "returns false" do
          marker.is_exact_match?(guess, index).should == false
        end
      end
    end

    describe "#evaluate" do
      let(:output) { double(:output).as_null_object }
      let(:solution) { "1234" }

      subject { Marker.new(solution) }

      context "with no matches" do
        it "returns an empty mark pattern" do
          subject.evaluate("9999").should == ""
        end
      end

      context "with 1 match" do
        context "in the incorrect location" do
          it "outputs a pattern of -" do
            subject.evaluate("9991").should == "-"
          end
        end

        context "in the correct location" do
          it "outputs a pattern of +" do
            subject.evaluate("1999").should == "+"
          end
        end
      end

      context "with 2 matches" do
        context "both in the incorrect location" do
          it "outputs a pattern of --" do
            subject.evaluate("9921").should == "--"
          end
        end

        context "both in the correct location" do
          it "outputs a pattern of ++" do
            subject.evaluate("1299").should == "++"
          end
        end

        context "one in the correct postion and one in the incorrect position" do
          it "outputs a pattern of +-" do
            subject.evaluate("1992").should == "+-"
          end
        end
      end

      context "with 3 matches" do
        context "with all in the correct locations" do
          it "outputs a pattern of +++" do
            subject.evaluate("1239").should == "+++"
          end
        end

        context "with all in the incorrect locations" do
          it "outputs a pattern of ---" do
            subject.evaluate("2193").should == "---"
          end
        end

        context "with 2 in the correct locations" do
          it "outputs a pattern of ++-" do
            subject.evaluate("1293").should == "++-"
          end
        end

        context "with 1 in the correct location" do
          it "outputs a pattern of +--" do
            subject.evaluate("1329").should == "+--"
          end
        end
      end

      context "with 4 matches" do
        context "with all in the correct locations" do
          it "outputs a pattern of ++++" do
            subject.evaluate("1234").should == "++++"
          end
        end

        context "with all in the incorrect locations" do
          it "outputs a pattern of ----" do
            subject.evaluate("4321").should == "----"
          end
        end

        context "with 2 in the correct locations" do
          it "outputs a pattern of ++--" do
            subject.evaluate("1324").should == "++--"
          end
        end

        context "with 1 in the correct location" do
          it "outputs a pattern of +--" do
            subject.evaluate("1423").should == "+---"
          end
        end
      end

      # context "when there are 4 exact matches" do
        # it "shows the win message" do
          # game.should_receive(:check_for_win)
          # output.should_receive(:puts).with("You are wicked smart")
          # subject.evaluate("1234")
        # end
      # end
    end
  end

end
