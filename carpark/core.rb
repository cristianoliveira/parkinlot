require_relative 'commands'

module Carpark
  class Core

    COMMANDS = {
      "create_parking_lot" => Carpark::Commands::Create,
      "park" => Carpark::Commands::Park,
      "leave" => Carpark::Commands::Leave,
      "status" => Carpark::Commands::Status,
      "registration_numbers_for_cars_with_colour" => Carpark::Commands::FindByColor,
      "slot_numbers_for_cars_with_colour" => Carpark::Commands::FindSlotByColor,
      "slot_number_for_registration_number" => Carpark::Commands::FindSlotByTicket,
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

    def commands_list
      COMMANDS.keys.sort
    end
  end
end
