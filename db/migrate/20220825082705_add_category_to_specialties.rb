class AddCategoryToSpecialties < ActiveRecord::Migration[7.0]
  def change
    add_column :specialties, :category, :string
  end
end
