require "spec_helper"

RSpec.describe RangeOperations::Pair do
  describe ".overlap?" do
    context "when the first if nil" do
      it "is false" do
        expect(described_class).not_to be_overlap(nil, 1..2)
      end
    end

    context "when the second is nil" do
      it "is false" do
        expect(described_class).not_to be_overlap(1..2, nil)
      end
    end

    context "when neither is nil" do
      context "when a contains the beginning of b" do
        it "is true" do
          expect(described_class).to be_overlap(1..3, 2..4)
        end
      end

      context "when b contains the beginning of a" do
        it "is true" do
          expect(described_class).to be_overlap(2..4, 1..3)
        end
      end

      context "when neither contains the beginning of the other" do
        it "is false" do
          expect(described_class).not_to be_overlap(1..2, 3..4)
        end
      end
    end
  end

  describe ".contiguous?" do
    context "when the first if nil" do
      it "is false" do
        expect(described_class).not_to be_contiguous(nil, 1..2)
      end
    end

    context "when the second is nil" do
      it "is false" do
        expect(described_class).not_to be_contiguous(1..2, nil)
      end
    end

    context "when neither is nil" do
      context "when a ends where b starts" do
        it "is true" do
          expect(described_class).to be_contiguous(1..2, 2..3)
        end
      end

      context "when b ends where a starts" do
        it "is true" do
          expect(described_class).to be_contiguous(2..3, 1..2)
        end
      end

      context "when a and b are the same" do
        it "is false" do
          expect(described_class).not_to be_contiguous(1..2, 1..2)
        end
      end

      context "when a's start is different to b's end and vice versa" do
        it "is false" do
          expect(described_class).not_to be_contiguous(1..20, 2..42)
        end
      end
    end
  end

  describe ".disjoint?" do
    context "when the first if nil" do
      it "is false" do
        expect(described_class).not_to be_disjoint(nil, 1..2)
      end
    end

    context "when the second is nil" do
      it "is false" do
        expect(described_class).not_to be_disjoint(1..2, nil)
      end
    end

    context "when a does not overlap or touch b" do
      it "is true" do
        expect(described_class).to be_disjoint(1..2, 3..4)
      end
    end
  end

  describe ".merge" do
    it "returns a Range with a's begin and b's end" do
      expect(described_class.merge(1..3, 2..4)).to eq(1..4)
    end
  end
end
