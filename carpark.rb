require "docopt"

require_relative 'carpark/store'
require_relative 'carpark/core'
require_relative 'carpark/repl'

VERSION="0.0.1"

USAGE = <<DOCOPT
The carpark command line.

Usage:
  #{__FILE__} [options]
  #{__FILE__} <filename> [options]

Options:
  -h --help     Show this screen.
  --version     Show version.
DOCOPT

begin
  args = Docopt::docopt(USAGE)

  if args["--version"]
    puts VERSION
    return
  end

  if args["--help"]
    puts USAGE
    return
  end

  store = Carpark::Store.new
  core = Carpark::Core.new(store)

  if args['<filename>'].nil?
    Carpark::REPL.new(core).loop
  else
    File.foreach(args['<filename>']) do |line, line_num|
      args = line.split(' ')
      cmd = args.shift

      puts core.execute(cmd, args)
    end
  end
rescue Docopt::Exit => e
  puts e.message
end
