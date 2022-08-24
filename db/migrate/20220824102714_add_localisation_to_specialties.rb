class AddLocalisationToSpecialties < ActiveRecord::Migration[7.0]
  def change
    add_column :specialties, :localisation, :string
  end
end
