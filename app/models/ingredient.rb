class Ingredient < ActiveRecord::Base
    validates :ingre, presence: true
    belongs_to :Recipe
end
