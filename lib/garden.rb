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
end