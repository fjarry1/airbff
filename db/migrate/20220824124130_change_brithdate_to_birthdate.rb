class ChangeBrithdateToBirthdate < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :brithdate, :birthdate
  end
end
