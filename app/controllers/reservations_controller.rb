class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all
    @rooms = Room.all
  end

  def create
    @reservation = Reservation.create(params.require(:reservation).permit(:start_date, :end_date, :room_id))
    @reservation.user_id = current_user.id

    #binding.pry
    if @reservation.save
      redirect_to room_reservations_path
    else
      render rooms_path
    end
  end
end
