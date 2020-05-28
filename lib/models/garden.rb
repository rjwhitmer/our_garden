/#
what plants are in garden

which gardeners are working on garden

how many of each plant is in garden

if garden was watered in the past 2 days (and by who), is watered
    if not watered, who watered it last, and when

#/

class Garden < ActiveRecord::Base
    belongs_to :gardener
    belongs_to :plant

    attr_accessor :is_watered
    
    @is_watered = false

    def water_the_garden
        @is_watered = true
    end

    def has_water
        if @is_watered
            return "Garden has plenty of water!"
        else
            return "This garden is dying of thirst!"
        end
    end

end