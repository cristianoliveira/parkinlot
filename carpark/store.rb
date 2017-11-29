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

      @cap.times do |i|
        @slots[i+1] = nil
      end
    end

    def park(ticket, car_color)
      if full?
        return nil
      end

      slot = free_slot

      @slots[slot] = { ticket: ticket, car_color: car_color }

      slot
    end

    def free_slot
      @slot.each do |k,v|
        if v.nil?
          return k
        end
      end
    end

    def full?
      @slot.length < @cap
    end
  end
end
