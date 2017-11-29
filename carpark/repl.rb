module Carpark

REPL_USAGE = <<EOF
    Carpark commands.

    Usage:
      help
      create_parking_log <capacity>
EOF

  class REPL
    def initialize(core)
      @core = core
    end

    def loop
      while true
        instruction = gets
        cmd_args = instruction.split(" ")
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
