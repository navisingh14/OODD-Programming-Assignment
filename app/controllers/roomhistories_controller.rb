class RoomhistoriesController < ApplicationController

  before_action :logged_in_member, only: [:index, :create , :cancel, :update,:new, :update ]
  protect_from_forgery with: :null_session
  include SessionsHelper

  def new
    @roomhistory = Roomhistory.new
    @room = Room.all
  end

  def create
    @roomhistory = Roomhistory.new(roomhistory_params)
    if @roomhistory.save
      flash[:success] = "Booked!"
      redirect_to rooms_path
    else
      render 'new'
    end
  end

def edit
end




  def cancel
    @roomhistory = Roomhistory.find(params[:id])
    @roomhistory.destroy
    redirect_to rooms_path
  end

  def update
  end


  def show
    @roomhistory = Roomhistory.find_all_by(number: room.number)
  end


  def index
    @roomhistory = Roomhistory.where(number: params[:number])
    # @roomhistory = Roomhistory.where("number = ? OR userid = ?", params[:number], params[:userid])
  end

  def historybymember
    @roomhistory = Roomhistory.where(userid: params[:userid])

  end




    private

    def logged_in_member
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end

      # def create
      #   @roomhistory = Roomhistory.new(roomhistory_params)
      #   if @roomhistory.save
      #     redirect_to schedule_path
      #   else
      #     render 'new'
      #   end
      # end

end

     def roomhistory_params

        params.require(:roomhistory).permit(:number, :userid, :time_from, :time_to)
      end

end