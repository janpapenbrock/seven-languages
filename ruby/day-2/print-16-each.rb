numbers = (1..16).to_a

group = []
numbers.each do |n|
  group << n
  if n % 4 == 0
    print group
    puts
    group = []
  end
end
