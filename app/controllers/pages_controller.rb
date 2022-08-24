class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @specialties = Specialty.first(8)
  end

  def profil
    @user = User.find(params[:id])
  end

  def reservationindex
    @specialties = Specialty.all
  end

  def reservationdestroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservation_index_path
  end
end
