class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  respond_to :html
  def show
    respond_with @user
  end

  private
  def set_user
  @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :city, :email, :password, :password_confirmation, :facebook, :twitter, :preference_id)
  end
end
