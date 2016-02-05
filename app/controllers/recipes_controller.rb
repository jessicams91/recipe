class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]
  respond_to :html
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    respond_with @recipe
  end

  def show
    respond_with @recipe
  end

  private

  def set_recipe
  @recipe = Recipe.find(params[:id])
  end

  def recipe_params
  params.require(:recipe)
    .permit(:name, :kitchen, :food_type, :preference, :servings, :cook_time, :step_by_step,
           :ingredients, :difficulty)
  end
end
