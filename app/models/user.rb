class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipe
  has_many :favorite_recipes
  has_many :favorites, through: :favorite_recipes, source: :recipe
  belongs_to :preference
  validates :name, :city, presence: true
end
