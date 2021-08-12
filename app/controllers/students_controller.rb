class StudentsController < ApplicationController
  def home
    @lessons = Lesson.where.not(id: LessonReservation.pluck(:lesson_id)).page(params[:page])
    if params[:teacher].present?
      @lessons = @lessons.joins(:teacher).where('teachers.name LIKE ?', params[:teacher]).page(params[:page])
    end
    if params[:language].present?
      @lessons = @lessons.joins(teacher: :language).where('languages.id::text LIKE ?', params[:language]).page(params[:page])
    end
    if params[:date].present?
      @lessons = @lessons.where('started_at >= ? AND ? >= started_at', params[:date].in_time_zone.beginning_of_day, params[:date].in_time_zone.end_of_day).page(params[:page])
    end
  end

  def index
    @lessons = current_student.lessons.page(params[:page])
  end

  def show
  end
end
