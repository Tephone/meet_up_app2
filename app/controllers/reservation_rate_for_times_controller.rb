class ReservationRateForTimesController < ApplicationController
  def show
    # @today = Date.today
    @today = DateTime.current
    @from = @today.beginning_of_month
    to = @today.end_of_month
    @datetimes_on_month = @from.upto(to).to_a
    @hours = (7..22).to_a.freeze
  end
end
