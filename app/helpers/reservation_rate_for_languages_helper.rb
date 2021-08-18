module ReservationRateForLanguagesHelper
  def reservation_rate_for_language_to_a_month(language, today)
    language_lessons = Lesson.where(teacher_id: language.teachers)
    language_lessons_for_a_month = language_lessons.where(started_at: today.all_month)
    reserved_language_lessons_for_a_month = language_lessons_for_a_month.select { |lesson| lesson.lesson_reservation.present? }
    if language_lessons_for_a_month.count.zero?
      '--'
    else
      reservation_rate = reserved_language_lessons_for_a_month.count.to_f / language_lessons_for_a_month.count * 100
      "#{reservation_rate.to_i}%"
    end
  end

  def reservation_rate_for_language_to_a_day(language, date)
    language_lessons = Lesson.where(teacher_id: language.teachers)
    language_lessons_for_a_day = language_lessons.where(started_at: date.in_time_zone.all_day)
    reserved_language_lessons_for_a_day = language_lessons_for_a_day.select { |lesson| lesson.lesson_reservation.present? }
    if language_lessons_for_a_day.count.zero?
      '--'
    else
      reservation_rate = reserved_language_lessons_for_a_day.count.to_f / language_lessons_for_a_day.count * 100
      "#{reservation_rate.to_i}%"
    end
  end
end
