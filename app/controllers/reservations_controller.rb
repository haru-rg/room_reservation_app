class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = current_user.reservations.all
    @rooms = Room.all
    @quantity = current_user.reservations.count
  end
  def new
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @guest_count = params[:guest_count]
    @room_id = params[:room_id]
    @user_id = params[:user_id]
  end

  def create
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :guest_count, :room_id, :user_id))

    if @reservation.save
      #reservationsのテーブルにデータが入る
      redirect_to reservation_path(@reservation.id)
    else
      redirect_to rooms_index_path
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @sum_price = @room.room_price * @reservation.guest_count
  end
end
