class Plant < ActiveRecord::Base
    has_many :gardens
    has_many :gardeners, through: :gardens
end