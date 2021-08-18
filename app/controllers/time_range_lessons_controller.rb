class TimeRangeLessonsController < ApplicationController
  def new
  end

  def create
    @date = params[:date].in_time_zone
    @start = params[:start].to_i
    @finish = params[:finish].to_i
    @times = (@start..@finish).to_a
    if @date.present? && @times.present?
      @times.each do |time|
        started_at = @date + time.hours
        current_teacher.lessons.create(started_at: started_at)
        redirect_to teachers_path, notice: 'レッスンを範囲指定登録しました'
      end
    else
      render :new
    end
  end
end
