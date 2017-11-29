require_relative '../Carpark/store'
require_relative '../Carpark/core'

describe "Running commands" do
  let(:store) { Carpark::Store.new }
  let(:core) { Carpark::Core.new(store) }

  context "given a unknown command" do
    it "fails" do
      expect(core.execute("unknown", [])).to eq("Command not found.")
    end
  end
end
