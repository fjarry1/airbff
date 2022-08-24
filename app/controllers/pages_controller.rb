class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @specialties = Specialty.first(8)
  end

  def profil
    @user = User.find(params[:id])
  end
end
