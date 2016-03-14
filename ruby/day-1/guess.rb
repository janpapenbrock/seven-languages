max = 10

result = rand(max)

def ask max, result
  puts ""
  puts "Please make your guess (1-#{max})."

  input = gets.chomp
  guess = input.to_i

  evaluate guess, result
end

def evaluate guess, result
  puts "Your guess is too high Try again!" if guess > result
  puts "Your guess is too low. Try again!" if guess < result

  guess == result
end

puts "Welcome to the most exciting number guessing game."
puts "A number has been chosen for you just now."

won = false
while !won
  won = ask max, result
end

puts "Congratulations, the number was #{result}. You are awesome!"
