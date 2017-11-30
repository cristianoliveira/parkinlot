require_relative '../../carpark/store'
require_relative '../../carpark/commands'

describe "finding by ticket" do
  let(:store) { Carpark::Store.new }
  let(:command) { Carpark::Commands::FindSlotByTicket.new(store) }

  context "when has data" do
    before(:each) do
      store.init(5)
      store.park("foo", 'white')
      store.park("foo2", 'white')
      store.park("bar", 'blue')
      store.park("baz", 'black')
    end

    it "prints the find info" do
      expect(command.execute(["foo"])).to eq("1")
      expect(command.execute(["bar"])).to eq("3")
    end
  end

  context "when has no data" do
    before(:each) do
      store.init(1)
      store.park("foobar", 'white')
    end

    it "prints the find info" do
      expect(command.execute(["foo"])).to eq("Not found")
    end
  end
end
