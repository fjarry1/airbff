class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @specialty = Specialty.find(params[:specialty_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.specialty_id = @specialty.id
    @reservation.user_id = current_user.id

    if @reservation.save
      redirect_to reservation_index_path(current_user)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(params[:reservation])
  end

  def destroy
    @reservation.destroy
    redirect_to reservation_index_path
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.status = "Accepté"
    @reservation.save
    redirect_to reservation_index_path
  end

  def decline
    @reservation = Reservation.find(params[:id])
    @reservation.status = "Refusé"
    @reservation.save
    redirect_to reservation_index_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :comment, :specialty_id, :user_id, :status)
  end
end
