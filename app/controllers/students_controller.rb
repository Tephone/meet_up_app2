class StudentsController < ApplicationController
  before_action :authenticate_student!
  
  def home
    @lessons = Lesson.where.not(id: LessonReservation.select(:lesson_id)).after_today.page(params[:page])
    if params[:teacher_name].present?
      @lessons = @lessons.joins(:teacher).search_by_teacher_name(params[:teacher_name]).page(params[:page])
    end
    if params[:language_id].present?
      @lessons = @lessons.joins(teacher: :language).search_by_language_id(params[:language_id]).page(params[:page])
    end
    if params[:date].present?
      @lessons = @lessons.search_by_date(params[:date]).page(params[:page])
    end
  end

  def index
    @lessons = current_student.lessons.after_today.page(params[:page])
  end

  def show
    @student = current_student
  end
end
