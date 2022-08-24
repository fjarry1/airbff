class SpecialtiesController < ApplicationController

  def index
    @specialties = Specialty.all
    @markers = @specialties.geocoded.map do |specialty| {
      lat: specialty.latitude,
      lng: specialty.longitude,
      # info_window: render_to_string(partial: "info_window", locals: { specialty: specialty })
    }
    end
  end

  def show
    @specialty = Specialty.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.new(specialty_params)
    if specialty.save
      redirect_to user_index_path
    else
      render :new
    end
  end

  def edit
    @specialty = Specialty.find(params[:id])
  end

  def update
    @specialty = Specialty.find(params[:id])
    @specialty.update(params[:specialty])
  end

  def destroy
    @specialty.destroy
    redirect_to user_index_path
  end

  private

  def specialty_params
    params.require(:specialty).permit(:title, :details, :price, :user_id)
  end
end
