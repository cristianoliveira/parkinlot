require_relative 'commands/create'

module Carpark
  class Core
    def initialize(store)
      @store = store
    end

    def execute(command, arguments)
      require 'byebug'; byebug
      case command
      when "create_parking_lot"
        Carpark::Commands::Create.new(@store).execute(arguments)
      else
        puts "Command not found."
      end
    end
  end
end
