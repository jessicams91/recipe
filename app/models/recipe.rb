class Recipe < ActiveRecord::Base
  belongs_to :kitchen
  validates :name, presence: true
end
