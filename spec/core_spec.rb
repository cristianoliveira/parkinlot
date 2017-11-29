require_relative '../Carpark/store'
require_relative '../Carpark/core'
require_relative '../Carpark/commands/command'

describe "Running commands" do
  let(:store) { Carpark::Store.new }
  let(:core) { Carpark::Core.new(store) }

  context "given a unknown command" do
    it "fails" do
      expect(core.execute("unknown", [])).to eq("Command not found.")
    end
  end

  context "given a known command" do
    let(:fakecmd) { Carpark::Commands::Command }

    before do
      expect(fakecmd).to receive(:execute).and_return("success")
      expect(Carpark::Commands::Command).to receive(:new).and_return(fakecmd)
    end

    it "succeed" do
      expect(core.execute("create_parking_lot", [])).to eq("success")
    end
  end
end
