require_relative './command'

module Carpark::Commands
  class Status < Command
    def execute(args)
      if @store.empty?
        return "Store is not initialized."
      end

      output = "Slot No. Registration No Colour\n"
      @store.slots.each do |spot, data|
        next unless data
        output += "#{spot} #{data[:ticket]} #{data[:car_color]}\n"
      end
      output
    end
  end
end
