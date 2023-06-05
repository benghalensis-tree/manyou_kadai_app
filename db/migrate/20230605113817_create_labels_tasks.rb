class CreateLabelsTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :labels_tasks do |t|
      t.references :task, foreign_key: true
      t.references :label, foreign_key: true
      t.timestamps
    end
  end
end
