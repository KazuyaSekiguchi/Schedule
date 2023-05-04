class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  
  validate :start_end_check
  def start_end_check
    errors.add(:end_date, "の日付を正しく記入してください") unless
    self.start_date < self.end_date
  end
  
  validates :memo, length: { maximum: 500 }
  
end
