/#
plant that was planted by gardener

all plants harvested by gardener

water the garden

#/

class Gardener < ActiveRecord::Base
    has_many :gardens
    has_many :plants, through: :gardens
end