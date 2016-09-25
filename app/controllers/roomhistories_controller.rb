class RoomhistoriesController < ApplicationController

  def new
    @roomhistory = Roomhistory.new
  end


  def index
    @roomhistory = Roomhistory.where(number: params[:number])
    # @roomhistory = Roomhistory.where("number = ? OR userid = ?", params[:number], params[:userid])
  end

  def historybymember
    @roomhistory = Roomhistory.where(userid: params[:userid])
  end
end
