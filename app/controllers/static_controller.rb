class StaticController < ApplicationController
  def index
    @reservations = Reservation.all
  end
end
