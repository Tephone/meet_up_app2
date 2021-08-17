class ReservationRateForTeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:teacher])
    @today = Date.today
    @from = @today.beginning_of_month
    to = @today.end_of_month
    @calendar_date = @from.upto(to)
    @calendar_date_for_week = @calendar_date.slice_before{|date| date.wday == 0}.to_a
    @DAY = ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'].freeze
  end
end
