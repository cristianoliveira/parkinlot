require_relative './command'

module Carpark::Commands
  class FindByColor < Command
    def execute(args)
      if @store.empty?
        return "Store is not initialized."
      end

      color = args[0]
      unless color
        return "Filter By Color command needs the color argument."
      end

      output = ""

      results = @store.find_by_color(color)
      results.each do |k, data|
        output += "#{data[:ticket]}, "
      end

      return "Nothing found" unless output

      output
    end
  end
end
