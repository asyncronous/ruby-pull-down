# Write a program that accepts someone's name and age, and responds
# as shown here:
loop do
# Program is run and outputs:
# "What is your name?"
puts "What is your name?"
# User inputs: "Tom"
name = gets.chomp
# Program outputs:
# "Hi Tom! How old are you?"
puts "Hi #{name} How old are you?"
# User inputs: 40
age = gets.chomp.to_i
# Program outputs:
# "Wow! You are 40 years old. Congratulations!"
puts "Wow! You are #{age} years old. Congradulations!"
# Beast mode challenge:
# Ater the above, the program calculates how many years until
# the user is 100 years old and tells the user. For example, for
# our user input above (Tom and 40), after outputing 
# "Wow! You are 40 years old. Congratulations!"
# The program also outputs:
# "Tom, in 60 years you will be 100 years old!"
puts "#{name}, in #{100 - age} years you will be 100 years old!"
# Beast mode++ challenge:
# Turn this program into a loop that will repeat these tasks until they type 'stop'
puts "Type (stop) to end code!"
end_code = gets.chomp
    if(end_code == "stop")
        break
    end
end