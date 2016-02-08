class Preference < ActiveRecord::Base
  has_many :recipe
  validates :name, presence: true
end
