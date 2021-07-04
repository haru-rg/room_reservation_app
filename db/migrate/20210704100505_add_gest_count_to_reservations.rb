class AddGestCountToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :gest_count, :integer
  end
end
