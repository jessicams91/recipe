class FoodType < ActiveRecord::Base
  has_many :recipe
  validates :name, presence: true
end
