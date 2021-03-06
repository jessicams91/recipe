class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipes
  has_many :favorite_recipes
  has_many :favorites, through: :favorite_recipes, source: :recipe
  has_many :kitchens_users
  has_many :kitchens, through: :kitchens_users, source: :kitchen
  validates :name, :city, presence: true
end
