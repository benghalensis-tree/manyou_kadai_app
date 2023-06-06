class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 200 }
  validates :status, presence: true, length: { maximum: 20 }
  validates :priority, presence: true, length: { maximum: 3}

end
