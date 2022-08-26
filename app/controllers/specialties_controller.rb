class SpecialtiesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        specialties.title @@ :query
        OR users.first_name @@ :query
        OR users.last_name @@ :query
      SQL
      @specialties = Specialty.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @specialties = Specialty.all
    end
      @markers = @specialties.geocoded.map do |specialty| {
        lat: specialty.latitude,
        lng: specialty.longitude,
        info_window: render_to_string(partial: "info_window", locals: { specialty: specialty }),
        specialty_id: specialty.id
      }
      end

  end

  def sport
    @specialties = Specialty.where(category: "SPORT")
  end

  def divertissement
    @specialties = Specialty.where(category: "DIVERTISSEMENT")
  end

  def artisanat
    @specialties = Specialty.where(category: "ARTISANAT")
  end

  def accompagnant
    @specialties = Specialty.where(category: "ACCOMPAGNANT")
  end

  def show
    @users = User.all
    @specialty = Specialty.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.new(specialty_params)
    @specialty.user_id = current_user.id
    if @specialty.save
      redirect_to root_path
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
