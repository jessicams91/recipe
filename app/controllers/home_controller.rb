class HomeController < ApplicationController
  respond_to :html
  def index
    @recipes = Recipe.all
    @kitchens = Kitchen.all
  end
end
