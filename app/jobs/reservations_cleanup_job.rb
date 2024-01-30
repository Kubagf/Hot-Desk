class ReservationsCleanupJob < ApplicationJob
  def perform
    Reservation.where('end_date < ?', Date.today).destroy_all
  end
end
