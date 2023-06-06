class AddNotNullToTaskNameAndContent < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tasks, :task_name, false
    change_column_null :tasks, :content, false
    change_column_null :tasks, :status, false
    change_column_null :tasks, :priority, false
    change_column_null :tasks, :end_date, false
  end
end
