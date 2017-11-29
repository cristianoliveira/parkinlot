require_relative '../../carpark/store'
require_relative '../../carpark/commands'

describe "creating store" do
  let(:store) { Carpark::Store.new }
  let(:command) { Carpark::Commands::Leave.new(store) }

  before(:each) do
    store.init(10)

    store.park("KA-01-HH-1234", "white")
    store.park("KA-01-HH-1235", "blue")
    store.park("KA-01-HH-1236", "black")
  end

  context "when has correct arguments" do
    context "when given spot has a car" do
      it "frees the spot 2" do
        args = ["2"]

        expect(command.execute(args)).to eq("Slot number #{2} is free")
        store.park("KA-01-HH-1236", "black")
      end

      it "frees the spot 1" do
        args = ["1"]

        expect(command.execute(args)).to eq("Slot number #{1} is free")
      end
    end
  end
end
