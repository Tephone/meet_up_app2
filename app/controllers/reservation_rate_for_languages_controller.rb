class ReservationRateForLanguagesController < ApplicationController
  def show
    @language = Language.find(params[:language])
    @today = Date.today
    @from = @today.beginning_of_month
    to = @today.end_of_month
    calender = @from.upto(to)
    @calender_for_week = calender.slice_before { |date| date.wday.zero? }.to_a
    @DAY = %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日].freeze
  end
end
