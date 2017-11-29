module Carpark
  class Store
    def initialize
      @cap = nil
      @slots = {}
    end

    def empty?
      @slots.empty?
    end

    def init(capacity)
      @cap = capacity
    end
  end
end
