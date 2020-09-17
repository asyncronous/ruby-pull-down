class Pokemanz
    attr_accessor :experience, :level, :happiness, :hunger, :max_health, :health, :name
    
    def initialize(name)
        @name = name
        @max_health = rand(60..100) # random 60 & 100
        @health = @max_health
        @level = 5
        @experience = 0
        @happiness = 100 # of 100
        @hunger = 0 # of 100
    end

    # def poke_count
    #     return pokemanz_list.count
    # end

    def train
        exp = @experience
        diff = rand(5..50)
        @experience += diff
        @happiness -= diff
        @hunger += diff
        return @experience - exp
    end

    def feed
        satiety = rand(25..75)
        @hunger -= satiety
    end

    def play
        fun = rand(50..75)
        @happiness += fun
    end

    def hungry
        time_hunger = rand(1..15)
        @hunger += time_hunger
    end

    def health_change
        if hunger > 75
            @health -= 10
            @happiness -= 5
        elsif hunger < 50
            @health += 5
            if @health > @max_health
                @health = @max_health
            end
        end
    end

    def fight(level)
        exp = @experience
        diff = rand(40..60)
        @experience += diff
        @happiness -= diff
        @hunger += diff
        @health -= level * rand(0..5)
        return @experience - exp
    end
end

class PokeBelt
    attr_accessor :poke_list
    
    def initialize
        @poke_list = []
    end

    def add_pokemanz(pokemanz)
        @poke_list.push(pokemanz)
    end
end

def poke_manz
    system("clear")
    puts "Welcome to Pokemanz"
    puts "\n"
    larry = Pokemanz.new("Larry")
    pokemanz = PokeBelt.new
    pokemanz.add_pokemanz(larry)

    puts "Your starter Pokemanz is Larry"
    # number_of_manz = poke_count
    # puts "You have #{number_of_manz} pokemanz"

    loop do
        puts "\n"
        list = []
        pokemanz.poke_list.each do |manz|
            list.push(manz.name)
        end
        puts "Which Pokemanz would you like to train: (#{list.join("/")})?"
        input = gets.chomp

        pokeman = ""
        pokemanz.poke_list.each do |manz|
            if(manz.name == input)
                pokeman = manz
            end
        end

        if pokeman == ""
            puts "You don't have that PokeManz!"
        else
            puts "\n"
            puts "#{pokeman.name} has #{pokeman.health}/#{pokeman.max_health} health!"
            puts "\n"
            puts "What would you like to do? (Train/Catch/Play/Feed/Close)"
            action = gets.chomp
            system("clear")
            
            if action == "Train"
                if pokeman.happiness > 0
                    
                    gained_exp = pokeman.train
                    if(pokeman.happiness < 0)
                        pokeman.happiness = 0
                    end
                    if(pokeman.hunger > 100)
                        pokeman.hunger = 100
                    end
    
                    puts "#{pokeman.name} has gained #{gained_exp} experience!"
                    puts "#{pokeman.name} now has #{pokeman.happiness}/100 happiness!"
                    puts "#{pokeman.name} now has #{pokeman.hunger}/100 hunger!"
    
                    if pokeman.experience > 50
                        pokeman.level += 1
                        pokeman.experience = 0
                        pokeman.max_health += rand(10..20)
                        puts "\n"
                        puts "#{pokeman.name} has gained a level! #{pokeman.name} is now level #{pokeman.level}!"
                        puts "\n"
                        puts "#{pokeman.name}'s max health is now #{pokeman.max_health}!"
                    end
                else
                    if(pokeman.happiness > 100)
                        pokeman.happiness = 100
                    end
                    puts "#{pokeman.name} is too sad to train :( Happiness: #{pokeman.happiness}/100"
                end
            elsif action == "Catch"
                puts "You have found a wild level 5 Pokemanz! Fight Pokemanz? (Y/N)"

                input = gets.chomp
                system("clear")

                if input == "Y"
                    level = 5
                    gained_exp = pokeman.fight(level)
                    puts "#{pokeman.name} has gained #{gained_exp} experience!"
                    puts "#{pokeman.name} now has #{pokeman.happiness}/100 happiness!"
                    puts "#{pokeman.name} now has #{pokeman.hunger}/100 hunger!"

                    puts "\n"
                    puts "#{pokeman.name} has #{pokeman.health}/#{pokeman.max_health} health!"

                    puts "\n"
                    puts "Catch wild Pokemanz? (Y/N)"
                    input = gets.chomp
                    system("clear")

                    if input == "Y" && pokemanz.poke_list.count < 6
                        
                        puts "Name your new PokeManz!"
                        new_name = gets.chomp
                        wild_pokemanz = Pokemanz.new(new_name)
                        pokemanz.add_pokemanz(wild_pokemanz)

                        system("clear")
                        puts "You now have #{pokemanz.poke_list.count} PokeManz!"
                        
                    else
                        puts "You already have 6 PokeManz! Don't be greedy!"
                    end
                end
            
            elsif action == "Play"
                pokeman.play
                if(pokeman.happiness > 100)
                    pokeman.happiness = 100
                end
    
                puts "#{pokeman.name} had fun!"
                puts "#{pokeman.name} now has #{pokeman.happiness}/100 happiness!"
    
            elsif action == "Feed"
                pokeman.feed
                if(pokeman.hunger < 0)
                    pokeman.hunger = 0
                end
                puts "Yum Yum!"
                puts "#{pokeman.name} now has #{pokeman.hunger}/100 hunger!"
    
            elsif action == "Close"
                break
            end
    
            #iterate hunger
            pokeman.hungry
            pokeman.health_change
            if(pokeman.happiness < 0)
                pokeman.happiness = 0
            end
            if (pokeman.health < 0)
                puts "\n"
                puts "#{pokeman.name} has died :("
                puts "\n"
                break
            end
        end
    end
end

#Main
system("clear")

puts "Pokemanz! Enter (Start) to Play"

input = gets.chomp

if input == "Start"
    poke_manz
end

# Lets play pokeymans.
# We have our very own pokeymans that we have to take care of.

# SECTION ONE - EASY

# PART ONE - CREATING THE GAME LOOP


# I want to create a loop that will give me the option to train, catch or take care of my pokeymans.
# Each one of these actions count as one cycle of my loop. I want to be given the option of what action I want to do each cycle.

# PART TWO - INITIALIZE

# Each pokeymans I catch has a name, health, level, experience, happiness, hunger. 
# Maximum health points start out as a random number between 60 and 100.
# Level starts at 5...for now.
# Experience starts at 0.
# Happiness at 100 out of 100
# Hunger at 0 out of 100.

# PART THREE - FIRST INSTANCE

# I start with 1 pokeyman and his name is Larry. Let's focus on Larry first before we start catching more pokeymans.
# For now, each cycle will only affect Larry.

# PART FOUR - INSTANCE METHODS & THE PASSAGE OF TIME

# Training my pokeymans will increase their experience by a little and eventually they will level up. 
# Leveling up will increase their level by one and their maximum health
# Training will also decrease their happiness. If it gets to 0 then they won't train :(
# I can play with my pokeymans which will increase their happiness.
# Playing or training with my pokeymans will increase their hunger, if their hunger gets too high they lose health points and happiness.
# Feeding my pokeymans will decrease their hunger.
# Update our game loop so that each cycle, all of our pokeymans gain a bit of hunger
# While a pokeymans hunger is low, they will regain health points each cycle

# If a pokeymans health reaches zero, it dies.

# END OF SECTION ONE

# SECTION TWO - MEDIUM
# PART ONE - OTHER POKEYMANS

# Now I want to find and catch and battle with other pokeymans.
# I can only have 6 pokeymans at a time, if I catch another over 6 I have to let him go :(
# Lets keep it simple for now, each cycle will introduce random encounter with a unnamed pokeyman that is level 5

# If we decide to fight it, we gain a lot more experience but lose hp.
# How much do we lose? Lets say we lose the other pokeymans level multiplied by a random number between 0 and 5. 

# If we decide to catch it then we add it to our caught pokeymans, and this will create a new instance of Pokeymans
# Catching a pokeymans will increase a count of caught pokeymans by one, remember this cant go higher than 6.

# Now that we have more than one caught pokeymans, we need to change our loop to ask which pokeymans we are training/taking care of.