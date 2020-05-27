/#
plant and save in the garden

harvest the plant

check days to harvest

count down days to harvest

User.create({
    name: Faker::FunnyName.three_word_name,
    address: Faker::Address.full_address,
    rating: 0
  })

#/

class Plant < ActiveRecord::Base
    has_many :gardens
    has_many :gardeners, through: :gardens
end