class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update]
  before_action :correct_admin, only: [:edit, :update]
  before_action :admin_admin, only: :destroy
  def new
    @admin = Admin.new
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
      redirect_back_or admin
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def index
    @admins = Admin.paginate(page: params[:page])
  end

  def destory
    Admin.find(params[:id]).destroy
    flash[:success] = "Admin deleted"
    redirect_to admins_url
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] ="Profile updated"
      redirect_to @admin
    else
      render 'edit'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password,
                                  :password_confirmation)
  end

  def logged_in_admin
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_admin
    @admin = Admin.find(params[:id])
    redirect_to(root_url) unless current_admin?(@admin)
  end

  def admin_admin
    redirect_to(root_url) unless current_admin.admin?
  end
end


