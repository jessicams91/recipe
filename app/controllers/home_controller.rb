class HomeController < ApplicationController
  respond_to :html
  def index
    @recipes = Recipe.all
    @kitchens = Kitchen.all
    @food_types = FoodType.all
  end
end
