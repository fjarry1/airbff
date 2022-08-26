class ChangeDateTypeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column(:reservations, :start_date, :datetime)
  end
end
