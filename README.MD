# Our Flatiron Garden

## Table of contents

- [](#)
  - [Table of contents](#table-of-contents)
  - [General info](#general-info)
  - [Intro Video](#intro-video)
  - [Technologies](#technologies)
  - [Setup](#setup)
  - [Code Examples](#code-examples)
  - [Features](#features)
  - [Status](#status)
  - [Inspiration](#inspiration)
  - [Contact](#contact)

## General Info

Our Flatiron Garden is a CLI application that allows users to create a garden, plant vegetable plants in the garden, see what they have planted, water the plants, harvest their plants, leave the garden, and destroy the entire garden (say, for a fall clean-up after all the harvesting is finished).

## Intro Video

[Mod 1 Flatiron Project by Bob Whitmer and Lynn Amsbury](https://www.youtube.com/watch?v=IildNMZANqg&feature=youtu.be)

## Technologies

* Ruby - version 2.6.1
* Rake - 13.0
* ActiveRecord - version 6.0
* Sinatra-activerecord - version 2.0
* SQLite3 - version 1.4

## Setup

To run this project, install it locally by cloning the GitHub repository and typing:
```ruby runner.rb```

## Code Examples

Shows how many of each plant is in a gardener's garden:
```ruby
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
```

Shows how long the plants have until harvest:
```ruby
def can_harvest
    puts "Your plants have this amount of time until harvest:"
    puts ""
    current_user.first.plants.each do |plant|
        puts  "#{plant.name.capitalize} has #{plant.days_to_harvest} days until harvest"
    end
    harvest_vegetable
end
```

## Features

* Creates new gardeners
* Allows a gardener to plant new plants
* Allows gardeners to see the plants growing in their garden
* Allows gardeners to water the garden
* Allows gardeners to harvest their plants

## To-do List

* Refactor “code smell”
* Add API functionality to include more plant choices
* Add functionality for a gardener to have multiple gardens

## Status

Project is: finished with option to expand functionality and DRY out code.

## Inspiration

It's springtime!

## Contact

Created by [Bob Whitmer](https://www.linkedin.com/in/bob-whitmer-b7269248/) and [Lynn Amsbury](https://www.linkedin.com/in/lynnamsbury/)

Feel free to contact us!