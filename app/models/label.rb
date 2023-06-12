class Label < ApplicationRecord

  has_many :labels_tasks
  has_many :labels_tasks_tasks, through: :labels_tasks, source: :task
  has_many :tasks, through: :labels_tasks

end
