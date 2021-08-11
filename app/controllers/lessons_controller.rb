class LessonsController < ApplicationController
  def new
    @lesson = current_teacher.lessons.new
  end

  def create
    @lesson = current_teacher.lessons.new(lesson_params)
    if @lesson.save
      redirect_to teachers_path, notice: 'レッスンを作成しました'
    else
      rendert :new
    end
  end

  def destroy
  end

  private

  def lesson_params
    params.require(:lesson).permit(:started_at)
  end
end
