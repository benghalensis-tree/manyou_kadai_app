class Task < ApplicationRecord
  validates :task_name, pressence: true, length: { maximum: 30 }
  validates :content, pressence: true, length: { maximum: 200 }
  validates :status, pressence: true, length: { maximum: 20 }
  validates :priority, pressence: true, length: { maximum: 3}
  validates :end_date, pressence: true, length: { maximum: 10 }

end
