class HomeController < ApplicationController
  respond_to :html
  def index
    @last_recipes = Recipe.first(20)
    @kitchens = Kitchen.all
    @food_types = FoodType.all
    @preferences = Preference.all
    @favorite_recipes = Recipe.order('favorite_count DESC').first(20)
  end
end
