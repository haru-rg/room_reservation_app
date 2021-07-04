class AddGuestCountToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :guest_count, :integer
  end
end
