numbers = (1..16).to_a

numbers.each_slice(4) do |group|
  print group
  puts
end
