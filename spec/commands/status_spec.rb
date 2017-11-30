require_relative '../../carpark/store'
require_relative '../../carpark/commands'

describe "creating store" do
  let(:store) { Carpark::Store.new }
  let(:command) { Carpark::Commands::Status.new(store) }

  before(:each) do
    store.init(10)
    store.park("foo", 'white')
    store.park("bar", 'blue')
    store.park("baz", 'black')
  end

  context "when has data" do
    it "prints the park info" do
      expect(command.execute(nil)).to include("1 foo white")
      expect(command.execute(nil)).to include("2 bar blue")
      expect(command.execute(nil)).to include("3 baz black")
    end
  end
end
