class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_collections, only: [:show]

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_collections
    @kitchens = Kitchen.all
    @food_types = FoodType.all
    @preferences = Preference.all
  end
end
