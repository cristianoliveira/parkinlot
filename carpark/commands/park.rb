require_relative './command'

module Carpark::Commands
  class Park < Command
    def execute(args)
      if @store.nil?
        return "Store is not initialized."
      end

      ticket_num, car_color = args[0], args[1]

      if ticket_num.nil? || car_color.nil?
        return "Park command needs 2 arguments. The ticket and car color."
      end

      slot = @store.park(ticket_num, car_color)

      if slot
        "Allocated slot number: #{slot}"
      else
        "Sorry, parking lot is full"
      end
    end
  end
end
