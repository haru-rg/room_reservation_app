class RemoveGestCountFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :gest_count, :integer
  end
end
