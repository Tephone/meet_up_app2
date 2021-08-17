class Language < ApplicationRecord
  has_many :teachers, dependent: :destroy
end
