# Preview all emails at http://localhost:3000/rails/mailers/notice_mailer
class NoticeMailerPreview < ActionMailer::Preview
  def reservation_notice_to_student
    lesson = LessonReservation.last.lesson
    NoticeMailer.reservation_notice_to_student(lesson)
  end

  def reservation_notice_to_teacher
    lesson = LessonReservation.last.lesson
    NoticeMailer.reservation_notice_to_teacher(lesson)
  end
end
