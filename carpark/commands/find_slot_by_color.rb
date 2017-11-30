require_relative './command'

module Carpark::Commands
  class FindSlotByColor < Command
    def execute(args)
      if @store.empty?
        return "Store is not initialized."
      end

      color = args[0]
      unless color
        return "Filter Slot By Color Number command needs the color argument."
      end

      output = ""

      results = @store.find_by_color(color)
      results.each do |k, _|
        output += "#{k}, "
      end

      return "Not found" if output.empty?

      output[0..-3]
    end
  end
end
