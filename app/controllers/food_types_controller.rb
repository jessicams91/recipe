class FoodTypesController < ApplicationController
  before_action :set_food_type, only: [:show]
  before_action :authenticate_user!, except: [:show]
  before_action :user_admin, except: [:show]
  respond_to :html
  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = FoodType.create(food_type_params)
    respond_with @food_type
  end

  def show
    respond_with @food_type
  end

  private

  def user_admin
    unless current_user.admin?
    flash[:notice] = 'Você não pode criar Tipos de Comida'
    redirect_to root_path
    end
  end

  def set_food_type
  @food_type = FoodType.find(params[:id])
  end

  def food_type_params
  params.require(:food_type).permit(:name)
  end
end
