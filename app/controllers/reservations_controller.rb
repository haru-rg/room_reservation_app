class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = current_user.reservations.all
    @rooms = Room.all
    @quantity = current_user.reservations.count
    @user = User.find(current_user.id)
  end
  def new
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :guest_count, :room_id, :user_id))
    @room_id = params[:room_id]
    @room = Room.find(@room_id)
    @user = User.find(@room.user_id)
    if @reservation.valid?
      #rooms/showで入力した内容にバリデーションをかける。
      #reservation/newを表示する前にバリデーションをかけてリダイレクトする。
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @guest_count = params[:guest_count]
      @room_id = params[:room_id]
      @user_id = params[:user_id]
      @room_price = params[:room_price]
      @sum_date = ((@end_date.to_time - @start_date.to_time) / 3600 / 24).to_i
      @sum_price = @room_price.to_i * @guest_count.to_i * @sum_date.to_i
    else
      flash[:notice] = '予約できない条件が選択されています'
      @room_id = params[:room_id]
      @room = Room.find(@room_id)
      @user = User.find(@room.user_id)
      render 'rooms/show', flash: { error: @reservation.errors.full_messages }
      #エラーメッセージをリダイレクト先に送る
    end
  end

  def create
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :guest_count, :room_id, :user_id))
    @room_id = @reservation.room_id
    if @reservation.save
      #reservationsのテーブルにデータが入る
      redirect_to reservation_path(@reservation.id)
    else
      flash[:notice] = '予約できない条件が選択されています'
      @reservation = Reservation.new(params.permit(:start_date, :end_date, :guest_count, :room_id, :user_id))
      @room = Room.find(@room_id)
      @user = User.find(@room.user_id)
      render 'rooms/show', flash: { error: @reservation.errors.full_messages }
      #binding.pry
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @sum_date = ((@reservation.end_date.to_time - @reservation.start_date.to_time) / 3600 / 24).to_i
    @user = User.find(@room.user_id)

    #binding.pry
    @sum_price = @room.room_price * @reservation.guest_count * @sum_date.to_i
  end
end
