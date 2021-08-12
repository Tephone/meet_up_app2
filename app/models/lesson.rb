class Lesson < ApplicationRecord
  belongs_to :teacher
  has_one :lesson_reservation
  scope :after_today, -> {where('started_at >= ?', Date.today)}
  scope :search_by_teacher_name, -> (teacher_name) {where('teachers.name LIKE ?', teacher_name)}
  scope :search_by_language_id, -> (language_id) {where('languages.id::text LIKE ?', language_id)}
  scope :search_by_date, -> (date) {where(started_at: date.in_time_zone.all_day)}
end
