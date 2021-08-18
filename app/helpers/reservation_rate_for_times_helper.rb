module ReservationRateForTimesHelper
  def reservation_rate_for_times(datetime)
    lessons_for_an_hour = Lesson.where('started_at >= ? AND ? >= started_at', datetime.beginning_of_hour, datetime.end_of_hour)
    reserved_lessons_for_an_hour = lessons_for_an_hour.select { |lesson| lesson.lesson_reservation.present? }
    if lessons_for_an_hour.count.zero?
      '--'
    else
      reservation_rate = reserved_lessons_for_an_hour.count.to_f / lessons_for_an_hour.count * 100
      reservation_rate.to_i
    end
  end
end
