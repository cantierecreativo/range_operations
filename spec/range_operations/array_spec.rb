require "spec_helper"

RSpec.describe RangeOperations::Array do
  describe ".sort" do
    let(:unsorted) { [4..9, 1..10] }
    let(:sorted) { [1..10, 4..9] }

    it "sorts by the .begin value" do
      expect(described_class.sort(unsorted)).to eq(sorted)
    end
  end

  describe ".simplify" do
    context "when items are backwards" do
      let(:partially_bent) { [9..5] }
      let(:straight) { [5..9] }

      it "straightens them" do
        expect(described_class.simplify(partially_bent)).to eq(straight)
      end
    end

    context "when the array is unsorted" do
      let(:unsorted) { [4..9, 1..3] }
      let(:sorted) { [1..3, 4..9] }

      it "sorts them" do
        expect(described_class.simplify(unsorted)).to eq(sorted)
      end
    end

    context "when items overlap" do
      let(:overlapping) { [1..10, 4..13] }
      let(:merged) { [1..13] }

      it "merges them" do
        expect(described_class.simplify(overlapping)).to eq(merged)
      end
    end

    context "when items are contiguous" do
      let(:contiguous) { [1..4, 4..13] }
      let(:merged) { [1..13] }

      it "merges them" do
        expect(described_class.simplify(contiguous)).to eq(merged)
      end
    end
  end

  describe ".subtract" do
    let(:range) { 1..10 }

    context "with no subranges" do
      let(:subs) { [] }
      let(:expected) { [range] }

      it "is the same as the range" do
        expect(described_class.subtract(range, subs)).to eq(expected)
      end
    end

    context "with subranges that don't overlap the range" do
      let(:subs) { [-1..0, 11..12] }
      let(:expected) { [range] }

      it "is the same as the range" do
        expect(described_class.subtract(range, subs)).to eq(expected)
      end
    end

    context "with subranges that overlap the start of the range" do
      let(:subs) { [0..3] }
      let(:expected) { [3..10] }

      it "starts from the end of the overlapping subrange" do
        expect(described_class.subtract(range, subs)).to eq(expected)
      end
    end

    context "with subranges that overlap the end of the range" do
      let(:subs) { [7..11] }
      let(:expected) { [1..7] }

      it "ends at the start of the overlapping subrange" do
        expect(described_class.subtract(range, subs)).to eq(expected)
      end
    end

    context "with subranges that are wholly included" do
      let(:subs) { [2..3, 5..6] }
      let(:expected) { [1..2, 3..5, 6..10] }

      it "equals the slots that remain" do
        expect(described_class.subtract(range, subs)).to eq(expected)
      end
    end

    context "with subranges that are unsorted" do
      let(:subs) { [4..5, 2..3] }
      let(:expected) { [1..2, 3..4, 5..10] }

      it "works the same" do
        expect(described_class.subtract(range, subs)).to eq(expected)
      end
    end

    context "with subranges that overlap each other" do
      let(:subs) { [2..4, 3..5] }
      let(:expected) { [1..2, 5..10] }

      it "works the same" do
        expect(described_class.subtract(range, subs)).to eq(expected)
      end
    end

    context "with subranges that are backwards" do
      let(:subs) { [3..2, 5..4] }
      let(:expected) { [1..2, 3..4, 5..10] }

      it "works the same" do
        expect(described_class.subtract(range, subs)).to eq(expected)
      end
    end

    context "with subranges that cover the whole range" do
      let(:subs) { [0..11] }
      let(:expected) { [] }

      it "is empty" do
        expect(described_class.subtract(range, subs)).to eq(expected)
      end
    end
  end
end
