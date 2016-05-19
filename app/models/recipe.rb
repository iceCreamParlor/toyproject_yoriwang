class Recipe < ActiveRecord::Base
    validates :recipe,:title, presence: true
    has_many :ingredients
    has_many :ingredient2s
    has_many :replies
    belongs_to :user
end
