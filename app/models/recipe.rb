class Recipe < ActiveRecord::Base
  belongs_to :kitchen
  belongs_to :food_type
  belongs_to :preference
  belongs_to :user
  validates :name, presence: true
  has_many :favorite_recipes
  has_many :favorited_by, through: :favorite_recipes, source: :user 
end
