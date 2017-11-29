require_relative './command'

module Carpark::Commands
  class Create < Command
    def execute(args)
      capacity = args[0]

      unless capacity
        return "Create command needs a capacity argument"
      end

      unless @store.empty?
        return "Store was already initialized."
      end

      begin
        @store.init(Integer(capacity))

        "Created a parking lot with #{capacity} slots"
      rescue ArgumentError
        "Invalid capacity. It must be a number."
      end
    end
  end
end
