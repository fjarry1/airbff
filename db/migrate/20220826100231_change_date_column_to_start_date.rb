class ChangeDateColumnToStartDate < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :date, :start_date
    add_column :reservations, :end_date, :datetime
  end
end
