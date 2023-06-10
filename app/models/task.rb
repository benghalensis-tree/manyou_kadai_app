class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 200 }
  validates :status, presence: true
  validates :priority, presence: true, length: { maximum: 3}
  enum status: {未着手:1, 着手中:2, 完了:3}
  enum priority: {低:1, 中:2, 高:3}
  scope :search_status, -> (status_params){ where(status: status_params) }
  scope :search_task_name, -> (task_name_params){ where('task_name LIKE ?', "%#{task_name_params}%") }
  belongs_to :user, dependent: :destroy

end
