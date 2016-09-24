class MembersController < ApplicationController

  before_action :logged_in_member, only: [:index, :edit, :update, :destroy]
  before_action :correct_member,   only: [:edit, :update]
  before_action :admin_member,     only: :destroy


  def index
    @member = Member.all
    end

  def show
    @member= Member.find(params[:id])
  end

  def new
    @member=Member.new

  end


  def create

    @member = Member.new(member_params) # Not the final implementation!
    @member.toggle!(:admin) if logged_in?
    if @member.save
      log_in @member
      # flash[:success] = "Welcome to the Sample App!"
      redirect_to @member
    else
      render 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      # Handle a successful update.
      flash[:success]= "Profile updated"
      redirect_to @member
    else
      render 'edit'
    end
  end


  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = "Member deleted"
    redirect_to @member
  end

  private
  def member_params
    params.require(:member).permit(:username, :email, :password,
                                 :password_confirmation, :admin)
  end

  def logged_in_member
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_member
    @member = Member.find(params[:id])
    redirect_to(root_url) unless current_member?(@member)
  end

  def admin_member
    redirect_to(root_url) unless current_member.admin?
  end

end
