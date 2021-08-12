class LessonsController < ApplicationController
  def new
    @lesson = current_teacher.lessons.new
  end

  def create
    @lesson = current_teacher.lessons.new(lesson_params)
    if @lesson.save
      redirect_to teachers_path, notice: 'レッスンを作成しました'
    else
      render :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def destroy
    @lesson = current_teacher.lessons.find(params[:id])
    @lesson.destroy!
    redirect_to teachers_path, notice: '削除しました'
  end

  private

  def lesson_params
    params.require(:lesson).permit(:started_at)
  end
end
