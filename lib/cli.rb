class Cli

    def initialize
        puts "Can you tell us your name?"
        @user = gets.capitalize.chomp
        @is_watered = false

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
        puts ""
        puts "What would you like to do?"
        puts ""
        puts "1. Add a plant to the garden."
        puts "2. What's in my garden?"
        puts "3. Water my plants."
        puts "4. Harvest my plants."
        puts "5. Exit the garden."
        puts "6. Clear the garden."
        
        menu_choice = gets.chomp.to_i
        puts ""

        if menu_choice == 1
            plant_choices
        elsif menu_choice == 2
            my_garden
        elsif menu_choice == 3
            has_water
        elsif menu_choice == 4
            days_until_harvest
        elsif menu_choice == 5    
            puts "Thanks for visiting!"
            return
        elsif menu_choice == 6    
            start_over
        else
            puts "Can't do that. Try again!"
            main_menu
        end
    end

    def plant_choices
        puts "Which vegetable would you like to plant?"
        available_plants = Plant.all.each do |plants|
            puts plants.name
        end

        choice = gets.chomp

        if plant_names.include? choice
            chosen_plant = available_plants.select do |plants|
                plants.name == choice
            end
        else
            puts ""
            puts "Not an available plant. Try again."
            puts ""
            plant_choices
        end

        current_user.first.plants << chosen_plant

        main_menu
    end

    def plant_names
        Plant.all.map do |plants|
            plants.name
        end
    end

    def my_garden
        if current_user.first.plants.any?
            has_plants
        else
            puts "Looks pretty empty. Maybe add some plants?"
            puts ""
        end
        main_menu
    end

    def has_plants
        puts "Hi #{@user}! Here's what you currently have in your garden!"
            current_user_plants = current_user.first.plants.map do |plant|
                plant.name
            end
            total_plants = current_user_plants.reduce({}) do |sum, plant_object|
                sum.merge({plant_object => (sum[plant_object] || 0) + 1})
            end
            total_plants.each do |plant_name, count|
                if count > 1
                    puts "You have #{count} #{plant_name} plants."
                else
                    puts "You have #{count} #{plant_name} plant."
                end
            end
    end

    def days_until_harvest
        if current_user.first.plants.any?
           can_harvest
        else
            puts "You have nothing in your garden!"
        end
        main_menu
    end

    def can_harvest
        puts "Your plants have this amount of time until harvest:"
        puts ""
        current_user.first.plants.each do |plant|
            puts  "#{plant.name.capitalize} has #{plant.days_to_harvest} days until harvest"
        end
        harvest_vegetable
    end

    def harvest_vegetable
        garden_plants = []
        puts "Which vegetable would you like to harvest?"
        vegetables_to_harvest = current_user.first.plants.select do |plant|
            plant.name
        end.uniq
        vegetables_to_harvest
        harvested_vegetable = gets.chomp
        current_user.first.plants.map do |plant|
             if plant.name != harvested_vegetable
                garden_plants << plant
             end
        end
        puts "#{harvested_vegetable}! YUMMY!"
        puts ""
        current_user.first.plants = garden_plants
        main_menu
    end

    def water_the_garden
        @is_watered = true
    end

    def has_water
        if @is_watered
            puts "Garden has plenty of water!"
        else
            puts "This garden is dying of thirst!"
            water_the_garden
        end
        main_menu
    end

    def start_over
        puts "Are you sure you want to clear the WHOLE garden? y/n"
        answer = gets.chomp
        if answer == "y"
            Garden.destroy_all
        elsif answer == "n"
            puts "Phew... That was a close one!"
        else
            puts "Not a valid response. Could you try again?"
            start_over
        end
        main_menu
    end 
end