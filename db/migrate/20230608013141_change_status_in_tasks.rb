class ChangeStatusInTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :status, :integer, default: 0, null: false
  
  end
end
