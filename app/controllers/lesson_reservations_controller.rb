class LessonReservationsController < ApplicationController
  def create
    lesson_reservation = current_student.lesson_reservations.new(lesson_id: params[:lesson_reservation][:lesson_id])
    lesson_reservation.save!
    redirect_to home_students_path, notice: 'レッスンを予約しました'
  end

  def destroy
    lesson_reservation = current_student.lesson_reservations.find(params[:id])
    lesson_reservation.destroy!
    redirect_to home_students_path, notice: 'レッスン予約を解除しました'
  end
end
