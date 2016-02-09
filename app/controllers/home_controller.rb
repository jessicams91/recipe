class HomeController < ApplicationController
  respond_to :html
  def index
    @recipes = Recipe.first(20)
    @kitchens = Kitchen.all
    @food_types = FoodType.all
    @preferences = Preference.all
  end
end
