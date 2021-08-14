class Lesson < ApplicationRecord
  belongs_to :teacher
  has_one :lesson_reservation, dependent: :destroy
  has_one :student, through: :lesson_reservation, source: :student
  has_one :review, dependent: :destroy
  validates :started_at, presence: true
  validate :started_at_should_be_after_now

  scope :after_today, -> { where('started_at >= ?', Time.zone.now) }
  scope :search_by_teacher_name, ->(teacher_name) { where('teachers.name LIKE ?', teacher_name) }
  scope :search_by_language_id, ->(language_id) { where('languages.id::text LIKE ?', language_id) }
  scope :search_by_date, ->(date) { where(started_at: date.in_time_zone.all_day) }

  def started_at_should_be_after_now
    errors.add(:started_at, "本日以降の日付を選択してください") if self.started_at&.past? #futureで今以降をあらわせる
  end
end
