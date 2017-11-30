require_relative './command'

module Carpark::Commands
  class FindSlotByTicket < Command
    def execute(args)
      if @store.empty?
        return "Store is not initialized."
      end

      ticket = args[0]
      unless ticket
        return "Filter Slot By Ticket Number command needs the number argument."
      end

      output = ""

      results = @store.find_by_ticket(ticket)
      results.each do |k, data|
        output += "#{k}"
      end

      return "Not found" if output.empty?

      output
    end
  end
end
