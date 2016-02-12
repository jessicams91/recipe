class Recipe < ActiveRecord::Base
  belongs_to :kitchen
  belongs_to :food_type
  belongs_to :preference
  belongs_to :user
  validates :name, :kitchen_id, :food_type_id, :preference_id,
            :ingredients, :step_by_step, presence: true
  has_many :favorite_recipes
  has_many :favorited_by, through: :favorite_recipes, source: :user
  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' },
                            default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: %r{/\Aimage\/.*\Z/}
end
