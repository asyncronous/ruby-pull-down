# PART 1
# Create a class called MyCar. 
class MyCar
    attr_accessor :color, :car_on
    attr_reader :year, :speed
    
    def initialize(year, color, model)
        @year = year
        @color = color
        @model = model
        @speed = 0
        @car_on = false
    end

    def start
        @car_on = true
    end
    
    def speed_up
        @speed += 10
    end

    def brake
        @speed -= 20

        if(@speed < 0)
            @speed = 0
        end
    end

    def turn_off
        @car_on = false
    end

    def spray_paint(color)
        @color = color
    end
end

# When you initialize a new instance or object of the class, 
# allow the user to input some instance variables that tell us the year, color, and model of the car. 

puts "Car Year?"
year = gets.chomp
puts "Car Color"
color = gets.chomp
puts "Car Model"
model = gets.chomp

car = MyCar.new(year, color, model)

loop do    
    puts "Brrrm Brrrm\n\n"

    puts "What would you like to do?"
    puts "(Start | Speed Up | Brake | Turn Off | Spray Paint | Exit)\n\n"

    input = gets.chomp
    system("clear")
    case input
    when "Start"
        if car.car_on == false
            puts "Brrrm Brrrm, lets go!\n\n"
            car.start
        else
            puts "The Car is already on!\n\n"
        end
    when "Speed Up"
        car.speed_up
        puts "You're going #{car.speed} km/ph!\n\n"
    when "Brake"
        car.brake
        puts "Slowing down! You're going #{car.speed} km/ph!\n\n"
    when "Turn Off"
        if car.speed > 5
            puts "You're going too fast to turn off the car!\n\n"
        else
            car.brake
            car.turn_off
            puts "Car is now off!"
        end
    when "Spray Paint"
        if car.on == true 
            "You can't spray paint your car while it's on!"
        else
            puts "What colour would you like to paint your car?\n\n"
            car.spray_paint(gets.chomp)
            puts "Your car is now #{car.color}\n\n"
        end
    when "Exit"
        puts "You got out of the car!\n\n"
        break
    end
end

# Create an instance variable called speed that starts at 0 during instantiation of the object to track the current speed of the car.

# PART 2
# Create instance methods that allow the car to start the car, speed up, brake, and shut the car off.

# Make a change to your method to your MyCar class to allow you to update and view the color of your car. 

# Then make a change to your  method that allows you to view, but not modify, the year of your car.

# Create a method called spray_paint that can be called and given an instance of MyCar that will modify the color of the car.

# PART 3
# Now you have all the methods you need to drive your car,
# Create a program loop that will ask you, the user, what you want to do while driving (speed up, brake, turn on the car etc)

# It doesn't make sense to be able to speed up your car when its not turned on, or braking reduces your speed below 0.
# Write logic that will prevent these things and any other edge cases.


