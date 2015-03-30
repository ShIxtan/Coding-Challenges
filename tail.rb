$defaults = {
  num_lines: 10,
  filename: nil,
  verbose: true,
  bytes: false,
  follow: false,
  sleep: 1
}

def tail(filenames, options)
  filenames.each do |filename|
    file = File.readlines(filename)
    options[:filename] = filename
    print_tail(file, options)
  end

  if options[:follow]
    file = File.readlines(filenames.last)
    count = file.length
    options[:verbose] = false
    while true
      sleep(options[:sleep])
      file = File.readlines(filenames.last)
      if file.length > count
        options[:num_lines] = file.length - count
        print_tail(file, options)
        count = file.length
      end
    end
  end
end

def print_tail(file, options)
  if options[:filename] && options[:verbose]
    puts "==>#{options[:filename]}<=="
  end
  if options[:bytes]
    file = file.join("").bytes.map(&:chr)
  end

  ((-1 * options[:num_lines])..-1).each do |i|
    print file[i]
  end
end

def parse_options(arguments)
  args = {
    filenames: [],
    options: $defaults
  }

  i = 0
  while i < arguments.length
    case arguments[i]
    when "-n", "--lines"
      args[:options][:num_lines] = arguments[i + 1].to_i
      i += 1
    when "-c", "--bytes"
      args[:options][:bytes] = true
      args[:options][:num_lines] = arguments[i + 1].to_i
      i += 1
    when "-q", "--quiet", "--silent"
      args[:options][:verbose] = false
    when "-v", "--verbose"
      args[:options][:verbose] = true
    when "-f", "--follow"
      args[:options][:follow] = true
    when "-s", "--sleep-interval"
      args[:options][:sleep] = arguments[i + 1].to_i
      i += 1
    else
      args[:filenames] << arguments[i]
    end
    i += 1
  end

  args
end

if __FILE__ == $PROGRAM_NAME
  args = parse_options(ARGV)
  tail(args[:filenames], args[:options])
end
