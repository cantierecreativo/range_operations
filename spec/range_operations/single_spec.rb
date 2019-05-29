require "spec_helper"

RSpec.describe RangeOperations::Single do
  describe ".backwards?" do
    context "when the range is nil" do
      it "is false" do
        expect(described_class).not_to be_backwards(nil)
      end
    end

    context "when the begin is before the end" do
      it "is false" do
        expect(described_class).not_to be_backwards(1..2)
      end
    end
  end

  describe ".straighten" do
    let(:bent) { 9..5 }
    let(:straight) { 5..9 }

    it "reverses backwards ranges" do
      expect(described_class.straighten(bent)).to eq(straight)
    end
  end
end
