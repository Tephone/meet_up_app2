module ReservationRateForTeachersHelper
  def reservation_rate_for_teacher_to_a_month(teacher, today)
    teacher_lessons_for_a_month = teacher.lessons.where(started_at: today.in_time_zone.all_month)
    reserved_teacher_lessons_for_a_month = teacher_lessons_for_a_month.select { |lesson| lesson.lesson_reservation.present?}
    if teacher_lessons_for_a_month.count == 0
      '--'
    else
      reservation_rate = reserved_teacher_lessons_for_a_month.count.to_f / teacher_lessons_for_a_month.count * 100
      "#{reservation_rate.to_i}%"
    end
  end

  def reservation_rate_for_teacher_to_a_day(teacher, date)
    teacher_lessons_for_a_day = teacher.lessons.where(started_at: date.in_time_zone.all_day)
    reserved_teacher_lessons_for_a_day = teacher_lessons_for_a_day.select { |lesson| lesson.lesson_reservation.present?}
    if teacher_lessons_for_a_day.count == 0
      '--'
    else
      reservation_rate = reserved_teacher_lessons_for_a_day.count.to_f / teacher_lessons_for_a_day.count * 100
      "#{reservation_rate.to_i}%"
    end
  end
end
