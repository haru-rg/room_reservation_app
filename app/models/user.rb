class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, presence: true #制限追記
  validates :introduction, length: { maximum: 200 } #制限追記

  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :start_date, presence: true
  validates :end_date, presence: true
end
