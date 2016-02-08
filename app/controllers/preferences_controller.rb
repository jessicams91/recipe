class PreferencesController < ApplicationController
  before_action :set_preference, only: [:show]
  respond_to :html
  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.create(preference_params)
    respond_with @preference
  end

  def show
    respond_with @preference
  end

  private

  def set_preference
  @preference = Preference.find(params[:id])
  end

  def preference_params
  params.require(:preference).permit(:name)
  end
end
