class AddCoordinatesToSpecialties < ActiveRecord::Migration[7.0]
  def change
    add_column :specialties, :latitude, :float
    add_column :specialties, :longitude, :float
  end
end
