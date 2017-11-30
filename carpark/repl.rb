require 'readline'

module Carpark

REPL_USAGE = <<EOF
Carpark commands.

Usage:
  help
  create_parking_lot
  park
  leave
  status
  registration_numbers_for_cars_with_colour
  slot_numbers_for_cars_with_colour
  slot_number_for_registration_number
EOF

  class REPL
    def initialize(core)
      @core = core
    end

    def loop
      comp = proc { |s| @core.commands_list.grep(/^#{Regexp.escape(s)}/) }

      Readline.completion_append_character = " "
      Readline.completion_proc = comp

      while line = Readline.readline('carpark> ', true)
        cmd_args = line.split(" ")
        command = cmd_args.shift

        if command.nil? || command == 'help'
          puts REPL_USAGE
        else
          puts @core.execute(command, cmd_args)
        end
      end
    end
  end
end
