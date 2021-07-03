class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = current_user.rooms.all ##現在のユーザーのもののみ表示
    @quantity = current_user.rooms.count
  end

  def new
    @room = Room.new
  end

  def create
    @room=Room.new(params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image))
    @room.user_id = current_user.id
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
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image))
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to :rooms
  end
end
