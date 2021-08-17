module ApplicationHelper
  def languages_option
    Language.all.map { |language| [t("language.#{language.name}"), language.id] }
  end

  def reservation_rate_for_times(datetime)
    lessons_for_an_hour = Lesson.where('started_at >= ? AND ? >= started_at', datetime.beginning_of_hour, datetime.end_of_hour)
    reserved_lessons_for_an_hour = lessons_for_an_hour.select { |lesson| lesson.lesson_reservation.present?}
    if lessons_for_an_hour.count == 0
        '--'
    else
      reservation_rate = reserved_lessons_for_an_hour.count.to_f / lessons_for_an_hour.count * 100
      reservation_rate.to_i
    end
  end

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

  def reservation_rate_for_language_to_a_month(language, today)
    language_lessons = Lesson.where(teacher_id: language.teachers)
    language_lessons_for_a_month = language_lessons.where(started_at: today.all_month)
    reserved_language_lessons_for_a_month = language_lessons_for_a_month.select { |lesson| lesson.lesson_reservation.present? }
    if language_lessons_for_a_month.count == 0
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
    if language_lessons_for_a_day.count == 0
      '--'
    else
      reservation_rate = reserved_language_lessons_for_a_day.count.to_f / language_lessons_for_a_day.count * 100
      "#{reservation_rate.to_i}%"
    end  
  end
end
