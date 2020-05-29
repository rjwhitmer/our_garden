class Garden < ActiveRecord::Base
    belongs_to :gardener
    belongs_to :plant
end