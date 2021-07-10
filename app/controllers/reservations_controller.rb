class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = current_user.reservations.all
    @rooms = Room.all
  end
  def new
    @reservation = current_user.reservations.new
  end

  def create
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:start_date, :end_date, :room_id))
    @reservation.user_id = current_user.id

    #binding.pry
    if @reservation.save
      redirect_to my_reservation_rooms_path
    else
      redirect_to rooms_index_path
    end
  end
end
