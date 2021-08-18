class ReservationRateForTimesController < ApplicationController
  def show
    if params[:beginning_of_month].present? && params[:end_of_month].present?
      @today = DateTime.current 
      @from = params[:beginning_of_month].to_date
      to = params[:end_of_month].to_date
      @datetimes_on_month = @from.upto(to).to_a
      @hours = (7..22).to_a.freeze
    else
      @today = DateTime.current
      @from = @today.beginning_of_month
      to = @today.end_of_month
      @datetimes_on_month = @from.upto(to).to_a
      @hours = (7..22).to_a.freeze
    end
  end
end
