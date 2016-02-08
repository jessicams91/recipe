  class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show]
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

  def set_kitchen
  @kitchen = Kitchen.find(params[:id])
  end

  def kitchen_params
  params.require(:kitchen).permit(:name)
  end
end
