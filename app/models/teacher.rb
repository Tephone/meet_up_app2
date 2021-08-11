class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  belongs_to :language
  has_many :lessons, dependent: :destroy
end
