require_relative 'commands/create'
require_relative 'commands/park'
require_relative 'commands/leave'
require_relative 'commands/status'
require_relative 'commands/find_by_color'

module Carpark
  class Core

    COMMANDS = {
      "create_parking_lot" => Carpark::Commands::Create,
      "park" => Carpark::Commands::Park,
      "leave" => Carpark::Commands::Leave,
      "status" => Carpark::Commands::Status,
      "registration_numbers_for_cars_with_colour" => Carpark::Commands::FindByColor
    }

    def initialize(store)
      @store = store
    end

    def execute(command, arguments)
      cmd = COMMANDS[command]

      unless cmd
        return "Command not found."
      end

      cmd.new(@store).execute(arguments)
    end
  end
end
