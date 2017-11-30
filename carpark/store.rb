module Carpark
  class Store
    attr_reader :slots

    def initialize
      @cap = 0
      @slots = {}
    end

    def empty?
      @slots.empty?
    end

    def init(capacity)
      @cap = capacity

      @slots = Hash[@cap.times.map{|i| ["#{i+1}", nil]}]
    end

    def park(ticket, car_color)
      if full?
        return nil
      end

      slot = free_slot

      unless slot
        return nil
      end

      @slots[slot] = { ticket: ticket, car_color: car_color }

      slot
    end

    def free(slot_number)
      @slots[slot_number] = nil
    end

    def free_slot
      @slots.each do |k,v|
        if v.nil?
          return k
        end
      end
    end

    def find_by_color(color)
      @slots.select{|_, value| value && value[:car_color] == color}
    end

    def find_by_ticket(ticket)
      @slots.select{|_, value| value && value[:ticket] == ticket}
    end

    def full?
      @slots.map{|_,v| v}.compact.length == @cap
    end
  end
end
