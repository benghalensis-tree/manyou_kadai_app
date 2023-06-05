class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :content
      t.string :status
      t.integer :priority
      t.date :end_date
      t.timestamps
    end
  end
end
