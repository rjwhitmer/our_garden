class Gardener < ActiveRecord::Base
    has_many :gardens
    has_many :plants, through: :gardens
end