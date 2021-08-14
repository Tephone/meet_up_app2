class StudentsController < ApplicationController
  before_action :authenticate_student!, except: [:index]

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
    if params[:student].present? 
      @student = Student.find(params[:student])
      @lessons = @student.lessons.after_today.page(params[:page])
      # teacherがstudent_indexにアクセスする場合、移行方法：teacherへログイン→teacher_indexから予約有のレッスン詳細へ→予約生徒名クリック
      # 講師がレッスンを予約した生徒のレッスン履歴を見れるようにlinkをつなぎました
    else
      @lessons = current_student.lessons.after_today.page(params[:page])
    end
  end

  def show
    @student = current_student
  end
end
