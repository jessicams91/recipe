class HomeController < ApplicationController
  respond_to :html
  def index
    @recipes = Recipe.all
  end
end
