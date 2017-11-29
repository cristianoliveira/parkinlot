module Carpark::Commands
  class Create
    def initialize(store)
      @store = store
    end

    def execute(args)
      capacity = args[0]

      unless capacity
        puts "Create command needs a capacity argument"
        return
      end

      unless @store.empty?
        puts "Store was already initialized."
        return
      end

      begin
        @store.init(Integer(capacity))

        puts "Created a parking lot with #{capacity} slots"
      rescue ArgumentError
        puts "Invalid capacity. It must be a number."
      end
    end
  end
end
