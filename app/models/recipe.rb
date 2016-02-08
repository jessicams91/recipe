class Recipe < ActiveRecord::Base
  belongs_to :kitchen
  belongs_to :food_type
  validates :name, presence: true
end
