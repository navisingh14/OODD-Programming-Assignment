class MembersController < ApplicationController
  def new
    @member=Member.new
  end

  def index
@member = Member.all
  end
  def show
  @member= Member.find(params[:id])
   end

  def create
    @member = Member.new(member_params)    # Not the final implementation!
    if @member.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @member
    else
      render 'new'
    end
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
