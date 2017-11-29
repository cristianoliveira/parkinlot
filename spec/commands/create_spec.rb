require_relative '../../carpark/store'
require_relative '../../carpark/commands'

describe "creating store" do
  let(:store) { Carpark::Store.new }
  let(:command) { Carpark::Commands::Create.new(store) }

  context "when has correct arguments" do
    it "creates the store with the given capacity" do
      args = ["3"]

      expect(store).to receive(:init).with(3)

      expect(command.execute(args))
        .to eq("Created a parking lot with #{args[0]} slots")
    end
  end

  context "when given wrong arguments" do
    it "rejects without capacity" do
      args = []

      expect(command.execute(args))
        .to eq("Create command needs a capacity argument")
    end

    it "rejects when capacity is not a number" do
      args = ["bla"]

      expect(command.execute(args))
        .to eq("Invalid capacity. It must be a number.")
    end

    it "rejects when stores is created already" do
      allow(store).to receive(:empty?).and_return(false)

      args = ["3"]

      expect(command.execute(args))
        .to eq("Store was already initialized.")
    end
  end
end
