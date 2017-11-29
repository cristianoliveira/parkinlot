require_relative 'commands/create'

module Carpark
  class Core

    COMMANDS = {
      "create_parking_lot" => Carpark::Commands::Create
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
