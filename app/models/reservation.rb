class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_finish_check
  validate :start_check

  def start_finish_check
    errors.add(:end_date, 'は開始時刻より遅い時間を選択してください') if self.start_date > self.end_date
  end

  def start_check
    errors.add(:start_date, 'は現在の日時より遅い時間を選択してください') if self.start_date < Time.now
  end
end
