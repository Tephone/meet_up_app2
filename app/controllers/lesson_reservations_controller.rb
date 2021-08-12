class LessonReservationsController < ApplicationController
  def create
    lesson_reservation = current_student.lesson_reservations.new(lesson_id: params[:lesson_reservation][:lesson_id])
    if current_student.rest_of_lesson_count <= 0
      redirect_to home_students_path, notice: 'チケットを購入してください'
    else
      lesson_reservation.save!
      NoticeMailer.reservation_notice_to_student(lesson_reservation.lesson).deliver_now
      NoticeMailer.reservation_notice_to_teacher(lesson_reservation.lesson).deliver_now
      redirect_to home_students_path, notice: 'レッスンを予約しました'
    end
  end

  def destroy
    lesson_reservation = current_student.lesson_reservations.find(params[:id])
    lesson_reservation.destroy!
    redirect_to home_students_path, notice: 'レッスン予約を解除しました'
  end
end
