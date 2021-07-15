class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true, presence: { message: '今日以降の日程に設定してください' }
  validates :end_date, presence: true
  validates :guest_count, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validate :start_finish_check
  validate :start_check

  def start_finish_check
    errors.add(:end_date, 'は開始時刻より遅い時間を選択してください') if self.start_date > self.end_date
  end

  def start_check
    errors.add(:start_date, 'は現在の日時より遅い時間を選択してください') if self.start_date < Time.now
  end
end
