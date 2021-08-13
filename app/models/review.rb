class Review < ApplicationRecord
  belongs_to :teacher
  belongs_to :lesson
end
