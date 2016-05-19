class Ingredient2 < ActiveRecord::Base
    validates :recipe_id, presence: true
    belongs_to :recipe
end
