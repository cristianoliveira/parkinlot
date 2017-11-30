require_relative '../../carpark/store'
require_relative '../../carpark/commands'

describe "creating store" do
  let(:store) { Carpark::Store.new }
  let(:command) { Carpark::Commands::FindByColor.new(store) }

  before(:each) do
    store.init(10)
    store.park("foo", 'white')
    store.park("foo2", 'white')
    store.park("bar", 'blue')
    store.park("baz", 'black')
  end

  context "when has data" do
    it "prints the find info" do
      expect(command.execute(["white"])).to include("foo")
      expect(command.execute(["white"])).to include("foo2")
    end
  end
end
