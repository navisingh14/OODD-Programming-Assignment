class RoomsController < ApplicationController
  before_action :logged_in_member, only: :index
  # before_action :admin, only: [:create, :destroy]
  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
  end

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Room added!"
      redirect_to @room
    else
      render 'new'
    end
  end

  def destroy
    Room.find(params[:id]).destroy
    flash[:success] = "Room deleted"
    redirect_to rooms_url
  end

    private

    def room_params
      params.require(:room).permit(:number, :building, :size)
    end

    # def admin
    #   redirect_to(root_url) unless current_member.admin?
    # end

    def logged_in_member
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
