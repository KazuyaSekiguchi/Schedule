class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true, unless: -> { start_date.blank? }
  validates :end_date, presence: true, unless: -> { end_date.blank? }
  
  validate :startdate
  def startdate
    errors.add(:start_date, "の日付が空欄です") if 
    start_date == nil
  end
  
  validate :enddate
  def enddate
    errors.add(:end_date, "の日付が空欄です") if 
    end_date == nil
  end
  
  
  validate :start_end_check
  def start_end_check
    unless start_date == nil || end_date == nil
      if start_date > end_date
         errors.add(:end_date, "の日付を正しく記入してください")
      end
    end
  end
  
  validates :memo, length: { maximum: 500 }
end
