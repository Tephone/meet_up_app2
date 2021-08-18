class MultipleLessonsController < ApplicationController  
  def new
  end

  def create
    multiple_lessons = params[:multiple_lesson][:started_at]
    multiple_lessons.each do |lesson|
      current_teacher.lessons.create!(started_at: lesson) if lesson.present?
    end
    redirect_to teachers_path, notice: '複数同時作成しました'
  end
end
