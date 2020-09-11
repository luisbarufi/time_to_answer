class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :check_password, only: [:update]
  before_action :set_user

  def edit
    @user.build_user_profile if @user.user_profile.blank?
  end

  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      if user_params[:user_profile_attributes][:avatar]
        redirect_to users_backoffice_welcome_index_path, notice: "Avatar atualizado com sucesso!"
      else
        redirect_to users_backoffice_profile_path, notice: "Usuário atualizado com sucesso!"
      end
    else
      render :edit
    end 
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
        user_profile_attributes: [:id, :address, :gender, :birthdate, :avatar] )
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def check_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].extract!(:password, :password_confirmation)
      end
    end
end
