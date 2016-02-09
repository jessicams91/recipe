class RecipesController < ApplicationController
  before_action :set_collections, only: [:new, :create, :edit]
  before_action :set_recipe, only: [:edit, :show, :update, :destroy]
  before_action :recipe_owner, only: [:edit, :update, :destroy]
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

  def edit
    respond_with @recipe
  end

  def update
    @recipe.update(recipe_params)
    respond_with @recipe
  end

  def destroy
    @recipe.destroy
  end

  private
  def recipe_owner
    unless @recipe.user_id == current_user.id
    flash[:notice] = 'Você não pode editar receitas criadas por outros usuários'
    redirect_to root_path
    end
  end

  def set_recipe
  @recipe = Recipe.find(params[:id])
  end

  def set_collections
    @kitchens = Kitchen.all
    @food_types = FoodType.all
    @preferences = Preference.all
  end

  def recipe_params
  params.require(:recipe)
    .permit(:name, :kitchen_id, :food_type_id, :preference_id, :servings, :cook_time, :step_by_step,
           :ingredients, :difficulty, :user_id)
  end
end
