class HomeController < ApplicationController
  respond_to :html
  def index
    @recipe = Recipe.all
  end
end
