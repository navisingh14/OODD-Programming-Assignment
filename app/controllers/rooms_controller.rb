class RoomsController < ApplicationController





  before_action :logged_in_member, only: [:create, :index, :destroy]


  # before_action :admin, only: [:create, :destroy]


  before_action :admin, only: [:create, :destroy]



  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
  end

  def index
    @room = Room.all
  end

  def search
    @room = Room.new
  end


  def showroom

    siz = room_params[:size]
      build = room_params[:building]

    if(siz.size==0&&build.size==0)
     @rooms = Room.all
    elsif(siz.size!=0&&build.size==0)
      @rooms =Room.where(size: params[:size])
   elsif(siz.size==0&&build.size!=0)
      @rooms =Room.where(building: params[:building])
    else
      @rooms =Room.where(building: room_params[:building]).where(size: room_params[:size])
    end

    end


  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)



    if !current_member.admin?
      redirect_to showroom_path
    elsif current_member.admin
    if @room.save
      flash[:success] = "Room added!"
      redirect_to rooms_path
    else
      render 'new'
    end
    end
  end


  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      # Handle a successful update.
      flash[:success]= "Room Info updated"
      redirect_to rooms_path
    else
      render 'edit'
    end
  end


  def destroy
    @room = Room.find(params[:id])
    Roomhistory.where(number: @room.number).each do |room|
      room.destroy
    end
    @room.destroy
    flash[:success] = "Room deleted"
    redirect_to rooms_path
  end

  def schedule
    @room = Room.find(params[:id])

  end

    private

    def room_params
      params.require(:room).permit(:number, :building, :size)
    end

    def admin
      redirect_to(root_url) unless current_member.admin?
    end

    def logged_in_member
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
