class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date
      t.text :comment
      t.references :specialty, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :is_accepted

      t.timestamps
    end
  end
end
