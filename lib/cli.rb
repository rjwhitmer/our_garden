class Cli

    def initialize
        puts "Can you tell us your name?"
        @user = gets.chomp

        if Gardener.find_by name: @user
            welcome
        else
            new_gardener
        end
    end

    def current_user
        Gardener.all.select do |gardeners|
            gardeners.name == @user
        end
    end

    def new_gardener
        puts "Looks like you're new around here. Mind giving us some details?"
        puts "How old are you?"
        age = gets.chomp.to_i
        puts "How many years have you been gardening?"
        years_experience = gets.chomp.to_i
        # binding.pry
        Gardener.create ({
            name: @user, 
            age: age, 
            years_experience: years_experience,
        })
        welcome
    end

    def welcome
        puts "Welcome to our community garden!"
    end

    def main_menu
        puts "What would you like to do?"
        puts ""
        puts "1. Add a plant to the garden."
        puts "2. What's in my garden?"
        puts "3. Water my plants."
        puts "4. Harvest my plants."
        puts "5. Start over."
        
        menu_choice = gets.chomp.to_i

        if menu_choice == 1
            plant_choices
        elsif menu_choice == 2
            my_garden
        elsif menu_choice == 3
            water_garden
        elsif menu_choice == 4
            days_until_harvest
            # harvest_vegetable
        elsif menu_choice == 5    
            start_over
        else
            puts "Can't do that. Try again!"
            main_menu
        end
        # binding.pry
    end

    def plant_choices
        puts "Which vegetable would you like to plant?"
        available_plants = Plant.all.each do |plants|
            puts plants.name
        end
        choice = gets.chomp

        chosen_plant = available_plants.select do |plants|
            plants.name == choice
        end

        current_user.first.plants << chosen_plant
        # binding.pry

        main_menu
    end

    def my_garden
        # binding.pry
        current_user.first.plants.each do |plant|
            puts plant.name
        end
        main_menu
    end

    def water_garden
       gardens = Garden.all.each do |gardens|
            puts gardens.name
       end

       puts "Which garden would you like to water?"
       garden_to_water = gets.chomp

       gardens.each do |garden|
        if garden.name == garden_to_water
            puts garden.has_water
            binding.pry
            puts "Water this garden? y/n"
                answer = gets.chomp
                if answer == "y"
                    garden.water_the_garden
                else
                    water_garden
                end
            end
        end
       main_menu
    end

    def days_until_harvest
        if current_user.first.plants.any?
            puts "Your plants have this amount of time until harvest:"
            puts ""
            current_user.first.plants.each do |plant|
                puts  "#{plant.name.capitalize} has #{plant.days_to_harvest} days until harvest"
            end
            harvest_vegetable
        else
            puts "You have nothing in your garden!"
        end
        main_menu
    end

    def harvest_vegetable
        puts "Which vegetable would you like to harvest?"
        vegetables_to_harvest = current_user.first.plants.select do |plant|
            plant.name
        end.uniq
        vegetables_to_harvest
        binding.pry
        harvested_vegetable = gets.chomp
        main_menu
    end

    def start_over
        Garden.destroy_all
        main_menu
    end

        
    
end