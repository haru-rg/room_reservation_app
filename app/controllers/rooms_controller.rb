class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room=Room.new(params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image))
    if@room.save
      redirect_to @room
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
