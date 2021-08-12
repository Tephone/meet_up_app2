class NoticeMailer < ApplicationMailer
  def reservation_notice_to_student(lesson)
    @lesson = lesson
    mail to: 'example@example.com', subject: '予約確認メール'
    #本来lesson.lesson_reservation.student.email等で送信先は指定すべきですが、今回はlocalのみのため適当なアドレスを指定しました
  end
  def reservation_notice_to_teacher(lesson)
    @lesson = lesson
    mail to: 'example@example.com', subject: '予約受付メール'  #本来lesson.teacher.email等で送信先は指定すべきですが、今回はlocalのみのため適当なアドレスを指定しました
  end
end
