class Kitchen < ActiveRecord::Base
  has_many :recipe
  belongs_to :user
  validates :name, presence: true
  has_many :kitchens_user
  has_many :users, through: :kitchens_user, source: :user
end
