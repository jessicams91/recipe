class Preference < ActiveRecord::Base
  has_many :recipe
  has_many :user
  validates :name, presence: true
end
