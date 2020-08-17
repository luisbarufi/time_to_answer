class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :check_password, only: [:update]
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all.page(params[:page])
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admins_backoffice_admins_path, notice: "Admin criado com sucesso!"
    else
      render :new
    end 
  end

  def update
    if @admin.update(admin_params)
      redirect_to admins_backoffice_admins_path, notice: "Admin atualizado com sucesso!"
    else
      render :edit
    end 
  end

  def destroy
    if @admin.destroy
      redirect_to admins_backoffice_admins_path, notice: "Admin excluido com sucesso!"
    else
      render :index
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def check_password
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end
end
