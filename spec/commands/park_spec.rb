require_relative '../../carpark/store'
require_relative '../../carpark/commands'

describe "creating store" do
  let(:store) { Carpark::Store.new }
  let(:command) { Carpark::Commands::Park.new(store) }

  before(:each) { store.init(10) }

  context "when has correct arguments" do
    context "when has free slot" do
      it "parks the car on the free spot" do
        ticket_num = "KA-01-HH-1234"
        car_color = "White"
        args = [ticket_num, car_color]

        expect(command.execute(args)).to eq("Allocated slot number: #{1}")
        expect(command.execute(args)).to eq("Allocated slot number: #{2}")
        expect(command.execute(args)).to eq("Allocated slot number: #{3}")
      end
    end

    context "when is full" do
      it "rejects with proper message" do
        expect(store).to receive(:full?).and_return(true)

        ticket_num = "KA-01-HH-1234"
        car_color = "White"
        args = [ticket_num, car_color]

        expect(command.execute(args)).to eq("Sorry, parking lot is full")
      end
    end
  end

  context "when given wrong args" do
    it "it rejects when ticket or color is missing" do
      ticket_num = "KA-01-HH-1234"
      car_color = "White"

      expect(command.execute([nil, nil]))
        .to eq("Park command needs 2 arguments. The ticket and car color.")
      expect(command.execute([nil, car_color]))
        .to eq("Park command needs 2 arguments. The ticket and car color.")
      expect(command.execute([ticket_num, nil]))
        .to eq("Park command needs 2 arguments. The ticket and car color.")
    end
  end
end
