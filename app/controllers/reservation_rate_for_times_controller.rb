class ReservationRateForTimesController < ApplicationController
  def show
    @today = DateTime.current
    if params[:beginning_of_month].present? && params[:end_of_month].present?
      @from = params[:beginning_of_month].to_date
      to = params[:end_of_month].to_date
    else
      @from = @today.beginning_of_month
      to = @today.end_of_month
    end
    @datetimes_on_month = @from.upto(to).to_a
    @hours = (7..22).to_a.freeze
  end
end
