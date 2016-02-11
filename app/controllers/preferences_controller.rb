class PreferencesController < ApplicationController
  before_action :set_preference, only: [:show]
  before_action :authenticate_user!, except: [:show]
  before_action :user_admin, except: [:show]
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

  def user_admin
    unless current_user.admin?
    flash[:notice] = 'Você não pode criar Preferências'
    redirect_to root_path
    end
  end

  def set_preference
  @preference = Preference.find(params[:id])
  end

  def preference_params
  params.require(:preference).permit(:name)
  end
end
