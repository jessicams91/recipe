class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show]
  before_action :authenticate_user!, except: [:show]
  before_action :user_admin, except: [:show]
  respond_to :html
  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.create(kitchen_params)
    respond_with @kitchen
  end

  def show
    respond_with @kitchen
  end

  private

  def user_admin
    unless current_user.admin?
      flash[:notice] = 'Você não pode criar Cozinhas'
      redirect_to root_path
    end
  end

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end
end
