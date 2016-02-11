class RegistrationsController < Devise::RegistrationsController
  before_action :set_preferences, only: [:new, :create, :edit, :update]
  before_action :user_owner, only: [:index, :edit, :update]
  before_action :set_user, only: [:edit, :show, :update]
  respond_to :html

  private
  def user_owner
    unless @user.id == current_user.id
    flash[:notice] = 'Você não pode editar dados de outros usuários!'
    redirect_to root_path
    end
  end

  def set_user
  @user = User.find(current_user)
  end

  def set_preferences
    @preference = Preference.all
  end

  def sign_up_params
    params.require(:user).permit(:name, :city, :email, :password, :password_confirmation, :facebook, :twitter, :preference_id)
  end

  def account_update_params
    params.require(:user).permit(:name, :city, :email, :password, :password_confirmation, :facebook, :twitter, :preference_id)
  end
end
