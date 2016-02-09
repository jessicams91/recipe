class Recipe < ActiveRecord::Base
  belongs_to :kitchen
  belongs_to :food_type
  belongs_to :preference
  belongs_to :user
  validates :name, presence: true
end
