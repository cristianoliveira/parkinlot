module Carpark::Commands
  class Command
    def initialize(store)
      @store = store
    end

    def execute(args)
      raise "Not implemented."
    end
  end
end
