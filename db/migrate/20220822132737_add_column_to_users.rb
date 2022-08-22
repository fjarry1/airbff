class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :brithdate, :date
    add_column :users, :description, :text
    add_column :users, :gender, :string
    add_column :users, :city, :string
  end
end
