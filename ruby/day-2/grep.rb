filename = ARGV.shift
unless filename
  puts "Required: Provide a file to grep."
  exit
end

pattern = ARGV.shift || ""

file = File.new(filename)
file.each_line do |line|
  puts "#{file.lineno} #{line}" if line[pattern]
end
