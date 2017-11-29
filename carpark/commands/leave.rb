require_relative './command'

module Carpark::Commands
  class Leave < Command
    def execute(args)
      if @store.nil?
        return "Store is not initialized."
      end

      slot_number = args[0]

      if slot_number.nil?
        return "Leave command need 1 arguments. The slot leaving"
      end

      @store.free(slot_number)

      "Slot number #{slot_number} is free"
    end
  end
end
